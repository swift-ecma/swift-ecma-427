extension ECMA_427.PURL {
    public init(_ string: some StringProtocol) throws(ECMA_427.Error) {
        var remainder = Substring(string)
        var subpath: [String] = []
        if let hash = remainder.lastIndex(of: "#") {
            subpath = try Self.segments(remainder[remainder.index(after: hash)...], .subpath)
            remainder = remainder[..<hash]
        }
        var qualifiers: [ECMA_427.PURL.Qualifier] = []
        if let question = remainder.lastIndex(of: "?") {
            qualifiers = try Self.qualifiers(remainder[remainder.index(after: question)...])
            remainder = remainder[..<question]
        }
        guard let colon = remainder.firstIndex(of: ":"), remainder[..<colon].lowercased() == ECMA_427.scheme else {
            throw .scheme
        }
        remainder = remainder[remainder.index(after: colon)...].drop { $0 == "/" }
        guard let slash = remainder.firstIndex(of: "/") else { throw .type }
        let type = String(remainder[..<slash])
        remainder = remainder[remainder.index(after: slash)...]
        while remainder.last == "/" { remainder = remainder.dropLast() }
        var last = remainder
        var namespace: [String] = []
        if let separator = remainder.lastIndex(of: "/") {
            last = remainder[remainder.index(after: separator)...]
            namespace = try Self.segments(remainder[..<separator], .namespace)
        }
        var version: String?
        if let at = last.lastIndex(of: "@") {
            version = try Self.decode(last[last.index(after: at)...])
            last = last[..<at]
        }
        try self.init(
            type: type,
            namespace: namespace,
            name: try Self.decode(last),
            version: version,
            qualifiers: qualifiers,
            subpath: subpath
        )
    }

    static func segments(_ text: Substring, _ failure: ECMA_427.Error) throws(ECMA_427.Error) -> [String] {
        let segments = try text.split(separator: "/").map { segment throws(ECMA_427.Error) in try Self.decode(segment) }
        guard segments.allSatisfy({ !$0.contains("/") }) else { throw failure }
        return segments
    }

    static func qualifiers(_ text: Substring) throws(ECMA_427.Error) -> [ECMA_427.PURL.Qualifier] {
        let pairs = try text.split(separator: "&").map { (pair: Substring) throws(ECMA_427.Error) -> ECMA_427.PURL.Qualifier in
            guard let equals = pair.firstIndex(of: "=") else { throw .key(String(pair)) }
            let key = pair[..<equals]
            guard !key.contains("%") else { throw .key(String(key)) }
            return try ECMA_427.PURL.Qualifier(key: String(key), value: try Self.decode(pair[pair.index(after: equals)...]))
        }
        let qualifiers = pairs.filter { !$0.value.isEmpty }
        if let key = Self.repeated(qualifiers.map(\.key).sorted()) { throw .duplicate(key) }
        return qualifiers
    }
}
