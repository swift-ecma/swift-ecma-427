import ECMA_427
import Testing

extension `ECMA_427.PURL Tests`.Test {
    struct Parse: Sendable {
        let description: String
        let input: String
        let expected: `ECMA_427.PURL Tests`.Test.Components?
    }
}

extension `ECMA_427.PURL Tests`.Test.Parse: CustomTestStringConvertible {
    var testDescription: String { description }
}
