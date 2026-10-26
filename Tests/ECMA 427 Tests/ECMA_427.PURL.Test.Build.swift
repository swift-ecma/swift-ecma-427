import ECMA_427
import Testing

extension ECMA_427.PURL.Test {
    struct Build: Sendable {
        let description: String
        let input: ECMA_427.PURL.Test.Components
        let expected: String?
    }
}

extension ECMA_427.PURL.Test.Build: CustomTestStringConvertible {
    var testDescription: String { description }
}
