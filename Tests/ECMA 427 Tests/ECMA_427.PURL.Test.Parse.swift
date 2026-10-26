import ECMA_427
import Testing

extension ECMA_427.PURL.Test {
    struct Parse: Sendable {
        let description: String
        let input: String
        let expected: ECMA_427.PURL.Test.Components?
    }
}

extension ECMA_427.PURL.Test.Parse: CustomTestStringConvertible {
    var testDescription: String { description }
}
