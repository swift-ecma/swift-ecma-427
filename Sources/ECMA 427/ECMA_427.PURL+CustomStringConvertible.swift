extension ECMA_427.PURL: CustomStringConvertible {
    public var description: String {
        let path = (namespace + [name]).map(ECMA_427.PURL.encode).joined(separator: "/")
        let version = self.version.map { "@" + ECMA_427.PURL.encode($0) } ?? ""
        let query = qualifiers.isEmpty ? "" : "?" + qualifiers.map { $0.key + "=" + ECMA_427.PURL.encode($0.value) }.joined(separator: "&")
        let fragment = subpath.isEmpty ? "" : "#" + subpath.map(ECMA_427.PURL.encode).joined(separator: "/")
        return ECMA_427.scheme + ":" + type + "/" + path + version + query + fragment
    }
}
