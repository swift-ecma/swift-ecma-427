extension ECMA_427 {
    public struct PURL: Sendable, Hashable {
        public let type: String
        public let namespace: [String]
        public let name: String
        public let version: String?
        public let qualifiers: [ECMA_427.PURL.Qualifier]
        public let subpath: [String]

        public init(
            type: String,
            namespace: [String] = [],
            name: String,
            version: String? = nil,
            qualifiers: [ECMA_427.PURL.Qualifier] = [],
            subpath: [String] = []
        ) throws(ECMA_427.Error) {
            guard ECMA_427.PURL.isValid(type: type) else { throw .type }
            guard namespace.allSatisfy({ !$0.isEmpty && !$0.contains("/") }) else { throw .namespace }
            let name = ECMA_427.PURL.trimmed(name)
            guard !name.isEmpty else { throw .name }
            let qualifiers = qualifiers.filter { !$0.value.isEmpty }.sorted { $0.key < $1.key }
            if let key = ECMA_427.PURL.repeated(qualifiers.map(\.key)) { throw .duplicate(key) }
            let subpath = subpath.filter { !["", ".", ".."].contains($0) }
            guard subpath.allSatisfy({ !$0.contains("/") }) else { throw .subpath }
            self.type = type.lowercased()
            self.namespace = namespace
            self.name = name
            self.version = version.flatMap { $0.isEmpty ? nil : $0 }
            self.qualifiers = qualifiers
            self.subpath = subpath
        }
    }
}
