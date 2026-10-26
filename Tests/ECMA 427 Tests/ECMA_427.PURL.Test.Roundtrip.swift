import ECMA_427
import Testing

extension ECMA_427.PURL.Test {
    struct Roundtrip: Sendable {
        let description: String
        let input: String
        let expected: String?
    }
}

extension ECMA_427.PURL.Test.Roundtrip: CustomTestStringConvertible {
    var testDescription: String { description }
}
