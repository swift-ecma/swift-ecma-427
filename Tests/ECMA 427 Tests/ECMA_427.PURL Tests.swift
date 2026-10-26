import ECMA_427
import Testing

extension ECMA_427.PURL {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension ECMA_427.PURL.Test.Unit {

    @Test(arguments: ECMA_427.PURL.Test.Parse.cases)
    func `every official parse case reads its components or fails`(example: ECMA_427.PURL.Test.Parse) throws {
        guard let expected = example.expected else {
            #expect(throws: ECMA_427.Error.self) { try ECMA_427.PURL(example.input) }
            return
        }
        #expect(ECMA_427.PURL.Test.Components(try ECMA_427.PURL(example.input)) == expected)
    }

    @Test(arguments: ECMA_427.PURL.Test.Build.cases)
    func `every official build case builds its canonical string or fails`(example: ECMA_427.PURL.Test.Build) throws {
        guard let expected = example.expected else {
            #expect(throws: ECMA_427.Error.self) { try example.input.purl() }
            return
        }
        #expect(try example.input.purl().description == expected)
    }

    @Test(arguments: ECMA_427.PURL.Test.Roundtrip.cases)
    func `every official roundtrip case reaches its canonical string or fails`(example: ECMA_427.PURL.Test.Roundtrip) throws {
        guard let expected = example.expected else {
            #expect(throws: ECMA_427.Error.self) { try ECMA_427.PURL(example.input) }
            return
        }
        #expect(try ECMA_427.PURL(example.input).description == expected)
    }

    @Test
    func `a parsed PURL exposes its components`() throws {
        let purl = try ECMA_427.PURL("pkg:deb/debian/curl@7.50.3-1?distro=jessie&arch=i386#usr/bin")
        #expect(purl.type == "deb")
        #expect(purl.namespace == ["debian"])
        #expect(purl.name == "curl")
        #expect(purl.version == "7.50.3-1")
        #expect(purl.qualifiers.map(\.key) == ["arch", "distro"])
        #expect(purl.subpath == ["usr", "bin"])
        #expect(purl.description == "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie#usr/bin")
    }

    @Test
    func `a built PURL encodes what it must and nothing else`() throws {
        let purl = try ECMA_427.PURL(
            type: "Generic",
            namespace: ["@scope"],
            name: "a b",
            version: "1.0+build",
            qualifiers: [try ECMA_427.PURL.Qualifier(key: "Download_URL", value: "https://example.com/a?b=c")]
        )
        #expect(purl.description == "pkg:generic/%40scope/a%20b@1.0%2Bbuild?download_url=https:%2F%2Fexample.com%2Fa%3Fb%3Dc")
        #expect(try ECMA_427.PURL(purl.description) == purl)
    }
}

extension ECMA_427.PURL.Test.`Edge Case` {

    @Test
    func `slashes after the scheme are ignored and the scheme and type are case insensitive`() throws {
        #expect(try ECMA_427.PURL("PKG:///NPM/foo").description == "pkg:npm/foo")
    }

    @Test
    func `a malformed escape is refused`() {
        #expect(throws: ECMA_427.Error.encoding) { try ECMA_427.PURL("pkg:npm/fo%zz") }
        #expect(throws: ECMA_427.Error.encoding) { try ECMA_427.PURL("pkg:npm/foo@1%2") }
    }

    @Test
    func `an escape that is not UTF-8 is refused`() {
        #expect(throws: ECMA_427.Error.encoding) { try ECMA_427.PURL("pkg:npm/foo%FF") }
    }

    @Test
    func `a decoded slash in a namespace segment is refused`() {
        #expect(throws: ECMA_427.Error.namespace) { try ECMA_427.PURL("pkg:npm/a%2Fb/c") }
    }

    @Test
    func `a decoded slash in a subpath segment is refused`() {
        #expect(throws: ECMA_427.Error.subpath) { try ECMA_427.PURL("pkg:npm/c#a%2Fb") }
    }

    @Test
    func `a repeated qualifier key is refused`() {
        #expect(throws: ECMA_427.Error.duplicate("a")) { try ECMA_427.PURL("pkg:npm/c?a=1&A=2") }
    }

    @Test
    func `a percent-encoded qualifier key is refused`() {
        #expect(throws: ECMA_427.Error.key("a%62")) { try ECMA_427.PURL("pkg:npm/c?a%62=1") }
    }

    @Test
    func `empty qualifier values and dot subpath segments are dropped`() throws {
        #expect(try ECMA_427.PURL("pkg:npm/c?b=&a=1#./x/../y/").description == "pkg:npm/c?a=1#x/y")
    }

    @Test
    func `a type must start with a letter`() {
        #expect(throws: ECMA_427.Error.type) { try ECMA_427.PURL(type: "3d", name: "c") }
    }
}
