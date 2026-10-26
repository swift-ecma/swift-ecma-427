extension ECMA_427.PURL {
    public struct Qualifier: Sendable, Hashable {
        public let key: String
        public let value: String

        public init(key: String, value: String) throws(ECMA_427.Error) {
            let key = key.lowercased()
            guard ECMA_427.PURL.Qualifier.isValid(key: key) else { throw .key(key) }
            self.key = key
            self.value = value
        }
    }
}
