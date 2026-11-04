# swift-ecma-427

Use this package when you need to read, build or compare Package-URLs (PURLs), the `pkg:` identifiers that SBOM formats use to name a package. Start from `ECMA_427.PURL`. For the SBOM formats themselves, use swift-ecma-424 for CycloneDX or swift-iso-5962 for SPDX.

## Laws

- Parsing a string and building from components both give the canonical form, and `ECMA_427.PURL.description` prints it. Two PURLs that differ only in ways the canonical form removes are equal.
- In the canonical form the scheme and type are lowercase, as are qualifier keys. Qualifiers are sorted by key, and a qualifier with an empty value is dropped. An empty version counts as no version.
- Subpath segments that are empty, `.` or `..` are dropped. Leading and trailing slashes around the name are stripped, and any slashes right after `pkg:` are ignored.
- Each component is percent-encoded on output, leaving only ASCII letters, digits, `-._~` and `:` as they are. So `+` in a version prints as `%2B`, and a `,` inside a qualifier value as `%2C`.
- A malformed `%` escape, or escapes that don't decode to UTF-8, are refused. So is a namespace or subpath segment that decodes to text containing `/`.
- Qualifier keys must be unique ignoring case, may not be percent-encoded, and must start with an ASCII letter followed by letters, digits, `.`, `-` or `_`. A type must start with an ASCII letter followed by letters, digits, `.` or `-`.
- No rules of individual package types are applied. The names of `github` or `pypi` packages keep their case, `_` is not changed to `-`, no type requires a namespace or a version, and the `checksum` qualifier stays one value.
