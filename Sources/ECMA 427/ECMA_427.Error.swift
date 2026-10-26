extension ECMA_427 {
    public enum Error: Swift::Error, Sendable, Equatable {
        case scheme
        case type
        case name
        case namespace
        case key(String)
        case duplicate(String)
        case subpath
        case encoding
    }
}
