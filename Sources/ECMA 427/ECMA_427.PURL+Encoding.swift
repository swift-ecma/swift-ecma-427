import RFC_3986

extension ECMA_427.PURL {
    static let allowed = RFC_3986.ByteSet.unreserved.union(RFC_3986.ByteSet(ascii: ":"))

    static func encode(_ component: String) -> String {
        String(decoding: RFC_3986.percentEncode(Array(component.utf8), allowing: allowed), as: UTF8.self)
    }

    static func decode(_ text: Substring) throws(ECMA_427.Error) -> String {
        let escapes = text.split(separator: "%", omittingEmptySubsequences: false).dropFirst()
        guard escapes.allSatisfy({ $0.prefix(2).count == 2 && $0.prefix(2).allSatisfy(\.isHexDigit) }) else {
            throw .encoding
        }
        guard let decoded = String(validating: RFC_3986.percentDecode(Array(text.utf8)), as: UTF8.self) else {
            throw .encoding
        }
        return decoded
    }
}
