extension ECMA_427.PURL {
    static func isValid(type: String) -> Bool {
        guard let first = type.first, first.isASCII, first.isLetter else { return false }
        return type.allSatisfy { $0.isASCII && ($0.isLetter || $0.isNumber || $0 == "." || $0 == "-") }
    }

    static func trimmed(_ name: String) -> String {
        String(name.drop { $0 == "/" }.reversed().drop { $0 == "/" }.reversed())
    }

    static func repeated(_ keys: [String]) -> String? {
        zip(keys, keys.dropFirst()).first { $0.0 == $0.1 }?.0
    }
}
