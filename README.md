# swift-ecma-427

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Swift implementation of ECMA-427, the Package-URL (PURL) specification.

## Overview

ECMA-427 1st edition (December 2025) standardises the Package-URL: `pkg:type/namespace/name@version?qualifiers#subpath`, the identifier SBOM formats such as CycloneDX (ECMA-424) and SPDX (ISO/IEC 5962) use to name a package. `ECMA_427.PURL` holds the decoded components and has two initializers: one parses a PURL string by the rules of Clause 5, the other builds one from components. Both validate, and both reach the canonical form: the type and qualifier keys lowercased, qualifiers sorted by key with empty values dropped, empty, `.` and `..` subpath segments dropped, and leading and trailing slashes stripped. `description` is the canonical string.

```swift
import ECMA_427

let purl = try ECMA_427.PURL("pkg:deb/debian/curl@7.50.3-1?distro=jessie&arch=i386")
purl.type         // "deb"
purl.namespace    // ["debian"]
purl.version      // "7.50.3-1"
purl.description  // "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie"
```

Components are percent-encoded with the RFC 3986 section 2.1 mechanism (`RFC_3986.percentEncode`), keeping only the alphanumeric and punctuation characters and the colon, as Clause 5 requires. A malformed escape or an escape that does not decode to UTF-8 is refused.

The text implemented is ECMA-427 Clause 5 as mirrored in `docs/standard/specification.md` of package-url/purl-spec v1.0.0, the release its maintainers aligned with the 1st edition. The official text is Ecma-TC54/ECMA-427.

## What is left out

ECMA-427 1st edition defines the PURL syntax and, in Clause 6, the schema a PURL type definition follows; it does not make the individual type definitions normative. This package therefore applies no type-specific rules: it does not lowercase the names of `github`, `pypi` or `composer` packages, does not turn `_` into `-` for `pypi`, and does not require a namespace for `swift` or a version for `swift` and `cpan`. The `checksum` qualifier is kept as one value, not split on commas.

The tests run the purl-spec v1.0.0 test suite (MIT): 472 of its 497 cases. The 25 left out all rest on a type definition rather than on Clause 5.

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
