import ECMA_427

extension ECMA_427.PURL.Test {
    struct Components: Sendable, Equatable {
        let type: String?
        let namespace: String?
        let name: String?
        let version: String?
        let qualifiers: [String: String]
        let subpath: String?
    }
}

extension ECMA_427.PURL.Test.Components {
    init(_ purl: ECMA_427.PURL) {
        self.init(
            type: purl.type,
            namespace: purl.namespace.isEmpty ? nil : purl.namespace.joined(separator: "/"),
            name: purl.name,
            version: purl.version,
            qualifiers: Dictionary(uniqueKeysWithValues: purl.qualifiers.map { ($0.key, $0.value) }),
            subpath: purl.subpath.isEmpty ? nil : purl.subpath.joined(separator: "/")
        )
    }

    func purl() throws(ECMA_427.Error) -> ECMA_427.PURL {
        guard let type else { throw .type }
        guard let name else { throw .name }
        return try ECMA_427.PURL(
            type: type,
            namespace: namespace?.split(separator: "/").map(String.init) ?? [],
            name: name,
            version: version,
            qualifiers: try qualifiers.map { element throws(ECMA_427.Error) in
                try ECMA_427.PURL.Qualifier(key: element.key, value: element.value)
            },
            subpath: subpath?.split(separator: "/").map(String.init) ?? []
        )
    }
}
