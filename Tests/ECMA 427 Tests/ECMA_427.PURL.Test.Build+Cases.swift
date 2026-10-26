// Transliterated from the purl-spec v1.0.0 test suite (package-url/purl-spec, tests/spec and tests/types), MIT.
// Cases whose expectation rests on a type definition rather than on ECMA-427 Clause 5 are left out.
import ECMA_427

extension ECMA_427.PURL.Test.Build {
    static let cases: [ECMA_427.PURL.Test.Build] = [
        ECMA_427.PURL.Test.Build(
            description: "specification: a type is always required",
            input: ECMA_427.PURL.Test.Components(type: nil, namespace: nil, name: "EnterpriseLibrary.Common", version: "6.0.1304", qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "specification: check for null type",
            input: ECMA_427.PURL.Test.Components(type: nil, namespace: nil, name: "nginx", version: "0.8.9", qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "specification: check for type that starts with number",
            input: ECMA_427.PURL.Test.Components(type: nil, namespace: nil, name: "nginx", version: "0.8.9", qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "specification: check for colon in type",
            input: ECMA_427.PURL.Test.Components(type: nil, namespace: nil, name: "nginx", version: "0.8.9", qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "specification: checks for invalid qualifier keys",
            input: ECMA_427.PURL.Test.Components(type: "npm", namespace: nil, name: "myartifact", version: "1.0.0", qualifiers: ["in production": "true"], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "specification: a name is required",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: nil, name: nil, version: nil, qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "specification: Build with multiple checksum",
            input: ECMA_427.PURL.Test.Components(
                type: "generic",
                namespace: nil,
                name: "openssl",
                version: "1.1.10g",
                qualifiers: ["checksum": "sha1:ad9503c3e994a4f,sha256:41bf9088b3a1e6c1ef1d"],
                subpath: nil
            ),
            expected: "pkg:generic/openssl@1.1.10g?checksum=sha1:ad9503c3e994a4f%2Csha256:41bf9088b3a1e6c1ef1d"
        ),
        ECMA_427.PURL.Test.Build(
            description: "alpm: Build test  for PURL type: alpm",
            input: ECMA_427.PURL.Test.Components(type: "alpm", namespace: "arch", name: "pacman", version: "6.0.1-1", qualifiers: ["arch": "x86_64"], subpath: nil),
            expected: "pkg:alpm/arch/pacman@6.0.1-1?arch=x86_64"
        ),
        ECMA_427.PURL.Test.Build(
            description: "alpm: Build test  for PURL type: alpm",
            input: ECMA_427.PURL.Test.Components(type: "alpm", namespace: "arch", name: "python-pip", version: "21.0-1", qualifiers: ["arch": "any"], subpath: nil),
            expected: "pkg:alpm/arch/python-pip@21.0-1?arch=any"
        ),
        ECMA_427.PURL.Test.Build(
            description: "alpm: Build test  for PURL type: alpm",
            input: ECMA_427.PURL.Test.Components(type: "alpm", namespace: "arch", name: "containers-common", version: "1:0.47.4-4", qualifiers: ["arch": "x86_64"], subpath: nil),
            expected: "pkg:alpm/arch/containers-common@1:0.47.4-4?arch=x86_64"
        ),
        ECMA_427.PURL.Test.Build(
            description: "apk: Build test  for PURL type: apk",
            input: ECMA_427.PURL.Test.Components(type: "apk", namespace: "alpine", name: "curl", version: "7.83.0-r0", qualifiers: ["arch": "x86"], subpath: nil),
            expected: "pkg:apk/alpine/curl@7.83.0-r0?arch=x86"
        ),
        ECMA_427.PURL.Test.Build(
            description: "apk: Build test  for PURL type: apk",
            input: ECMA_427.PURL.Test.Components(type: "apk", namespace: "alpine", name: "apk", version: "2.12.9-r3", qualifiers: ["arch": "x86"], subpath: nil),
            expected: "pkg:apk/alpine/apk@2.12.9-r3?arch=x86"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bazel: bazel module with default registry",
            input: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_java", version: "7.8.0", qualifiers: [:], subpath: nil),
            expected: "pkg:bazel/rules_java@7.8.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bazel: bazel module with custom registry",
            input: ECMA_427.PURL.Test.Components(
                type: "bazel",
                namespace: nil,
                name: "rules_java",
                version: "7.8.0",
                qualifiers: ["repository_url": "https://example.org/bazel-registry"],
                subpath: nil
            ),
            expected: "pkg:bazel/rules_java@7.8.0?repository_url=https:%2F%2Fexample.org%2Fbazel-registry"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bazel: bazel module with relaxed semver version",
            input: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "curl", version: "8.8.0.bcr.1", qualifiers: [:], subpath: nil),
            expected: "pkg:bazel/curl@8.8.0.bcr.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bazel: bazel module names are actually all lowercased, but this is not enforced by the PURL type spec for reasons",
            input: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "Curl", version: "8.8.0.bcr.1", qualifiers: [:], subpath: nil),
            expected: "pkg:bazel/Curl@8.8.0.bcr.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bazel: bazel module with multi-segment package",
            input: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_java", version: "8.5.0", qualifiers: [:], subpath: "java/runfiles"),
            expected: "pkg:bazel/rules_java@8.5.0#java/runfiles"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bazel: bazel module with target reference",
            input: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_java", version: "8.5.0", qualifiers: [:], subpath: "java/runfiles:runfiles"),
            expected: "pkg:bazel/rules_java@8.5.0#java/runfiles:runfiles"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bazel: bazel module with single-segment package",
            input: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_go", version: "0.48.0", qualifiers: [:], subpath: "go"),
            expected: "pkg:bazel/rules_go@0.48.0#go"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bitbucket: bitbucket namespace and name should be lowercased",
            input: ECMA_427.PURL.Test.Components(type: "bitbucket", namespace: "birkenfeld", name: "pygments-main", version: "244fd47e07d1014f0aed9c", qualifiers: [:], subpath: nil),
            expected: "pkg:bitbucket/birkenfeld/pygments-main@244fd47e07d1014f0aed9c"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bitbucket: Build test  for PURL type: bitbucket",
            input: ECMA_427.PURL.Test.Components(type: "bitbucket", namespace: "birkenfeld", name: "pygments-main", version: "244fd47e07d1014f0aed9c", qualifiers: [:], subpath: nil),
            expected: "pkg:bitbucket/birkenfeld/pygments-main@244fd47e07d1014f0aed9c"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bitnami: Build test  for PURL type: bitnami",
            input: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: nil, qualifiers: ["distro": "debian-12"], subpath: nil),
            expected: "pkg:bitnami/wordpress?distro=debian-12"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bitnami: Build test  for PURL type: bitnami",
            input: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: "6.2.0", qualifiers: ["distro": "debian-12"], subpath: nil),
            expected: "pkg:bitnami/wordpress@6.2.0?distro=debian-12"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bitnami: Build test  for PURL type: bitnami",
            input: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: "6.2.0", qualifiers: ["arch": "arm64", "distro": "debian-12"], subpath: nil),
            expected: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=debian-12"
        ),
        ECMA_427.PURL.Test.Build(
            description: "bitnami: Build test  for PURL type: bitnami",
            input: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: "6.2.0", qualifiers: ["arch": "arm64", "distro": "photon-4"], subpath: nil),
            expected: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=photon-4"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cargo: Build test  for PURL type: cargo",
            input: ECMA_427.PURL.Test.Components(type: "cargo", namespace: nil, name: "rand", version: "0.7.2", qualifiers: [:], subpath: nil),
            expected: "pkg:cargo/rand@0.7.2"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cargo: Build test  for PURL type: cargo",
            input: ECMA_427.PURL.Test.Components(type: "cargo", namespace: nil, name: "clap", version: "2.33.0", qualifiers: [:], subpath: nil),
            expected: "pkg:cargo/clap@2.33.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cargo: Build test  for PURL type: cargo",
            input: ECMA_427.PURL.Test.Components(type: "cargo", namespace: nil, name: "structopt", version: "0.3.11", qualifiers: [:], subpath: nil),
            expected: "pkg:cargo/structopt@0.3.11"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cocoapods: Build test  for PURL type: cocoapods",
            input: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "AFNetworking", version: "4.0.1", qualifiers: [:], subpath: nil),
            expected: "pkg:cocoapods/AFNetworking@4.0.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cocoapods: Build test  for PURL type: cocoapods",
            input: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "MapsIndoors", version: "3.24.0", qualifiers: [:], subpath: nil),
            expected: "pkg:cocoapods/MapsIndoors@3.24.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cocoapods: Build test  for PURL type: cocoapods",
            input: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "ShareKit", version: "2.0", qualifiers: [:], subpath: "Twitter"),
            expected: "pkg:cocoapods/ShareKit@2.0#Twitter"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cocoapods: Build test  for PURL type: cocoapods",
            input: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "GoogleUtilities", version: "7.5.2", qualifiers: [:], subpath: "NSData+zlib"),
            expected: "pkg:cocoapods/GoogleUtilities@7.5.2#NSData%2Bzlib"
        ),
        ECMA_427.PURL.Test.Build(
            description: "composer: composer names are not case sensitive",
            input: ECMA_427.PURL.Test.Components(type: "composer", namespace: "laravel", name: "laravel", version: "5.5.0", qualifiers: [:], subpath: nil),
            expected: "pkg:composer/laravel/laravel@5.5.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "composer: Build test  for PURL type: composer",
            input: ECMA_427.PURL.Test.Components(type: "composer", namespace: "laravel", name: "laravel", version: "5.5.0", qualifiers: [:], subpath: nil),
            expected: "pkg:composer/laravel/laravel@5.5.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "conan: valid conan purl",
            input: ECMA_427.PURL.Test.Components(type: "conan", namespace: nil, name: "cctz", version: "2.3", qualifiers: [:], subpath: nil),
            expected: "pkg:conan/cctz@2.3"
        ),
        ECMA_427.PURL.Test.Build(
            description: "conan: valid conan purl with namespace and qualifier channel",
            input: ECMA_427.PURL.Test.Components(type: "conan", namespace: "bincrafters", name: "cctz", version: "2.3", qualifiers: ["channel": "stable"], subpath: nil),
            expected: "pkg:conan/bincrafters/cctz@2.3?channel=stable"
        ),
        ECMA_427.PURL.Test.Build(
            description: "conan: Build test  for PURL type: conan",
            input: ECMA_427.PURL.Test.Components(type: "conan", namespace: nil, name: "openssl", version: "3.0.3", qualifiers: [:], subpath: nil),
            expected: "pkg:conan/openssl@3.0.3"
        ),
        ECMA_427.PURL.Test.Build(
            description: "conan: Build test  for PURL type: conan",
            input: ECMA_427.PURL.Test.Components(type: "conan", namespace: "openssl.org", name: "openssl", version: "3.0.3", qualifiers: ["channel": "stable", "user": "bincrafters"], subpath: nil),
            expected: "pkg:conan/openssl.org/openssl@3.0.3?channel=stable&user=bincrafters"
        ),
        ECMA_427.PURL.Test.Build(
            description: "conan: Build test  for PURL type: conan",
            input: ECMA_427.PURL.Test.Components(
                type: "conan",
                namespace: "openssl.org",
                name: "openssl",
                version: "3.0.3",
                qualifiers: [
                    "arch": "x86_64", "build_type": "Debug", "compiler": "Visual Studio", "compiler.runtime": "MDd", "compiler.version": "16", "os": "Windows",
                    "prev": "b429db8a0e324114c25ec387bfd8281f330d7c5c", "rrev": "93a82349c31917d2d674d22065c7a9ef9f380c8e", "shared": "True",
                ],
                subpath: nil
            ),
            expected:
                "pkg:conan/openssl.org/openssl@3.0.3?arch=x86_64&build_type=Debug&compiler=Visual%20Studio&compiler.runtime=MDd&compiler.version=16&os=Windows&prev=b429db8a0e324114c25ec387bfd8281f330d7c5c&rrev=93a82349c31917d2d674d22065c7a9ef9f380c8e&shared=True"
        ),
        ECMA_427.PURL.Test.Build(
            description: "conda: valid conda purl with qualifiers",
            input: ECMA_427.PURL.Test.Components(
                type: "conda",
                namespace: nil,
                name: "absl-py",
                version: "0.4.1",
                qualifiers: ["build": "py36h06a4308_0", "channel": "main", "subdir": "linux-64", "type": "tar.bz2"],
                subpath: nil
            ),
            expected: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2"
        ),
        ECMA_427.PURL.Test.Build(
            description: "conda: Build test  for PURL type: conda",
            input: ECMA_427.PURL.Test.Components(
                type: "conda",
                namespace: nil,
                name: "absl-py",
                version: "0.4.1",
                qualifiers: ["build": "py36h06a4308_0", "channel": "main", "subdir": "linux-64", "type": "tar.bz2"],
                subpath: nil
            ),
            expected: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cpan: CPAN distribution name are case sensitive",
            input: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "DROLSKY", name: "DateTime", version: "1.55", qualifiers: [:], subpath: nil),
            expected: "pkg:cpan/DROLSKY/DateTime@1.55"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cpan: Build test for PURL type: cpan",
            input: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "DROLSKY", name: "DateTime", version: "1.55", qualifiers: [:], subpath: nil),
            expected: "pkg:cpan/DROLSKY/DateTime@1.55"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cpan: Build test for PURL type: cpan",
            input: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "GDT", name: "URI-PackageURL", version: nil, qualifiers: [:], subpath: nil),
            expected: "pkg:cpan/GDT/URI-PackageURL"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cpan: Build test for PURL type: cpan",
            input: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "OALDERS", name: "libwww-perl", version: "6.76", qualifiers: [:], subpath: nil),
            expected: "pkg:cpan/OALDERS/libwww-perl@6.76"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cpan: Build test for PURL type: cpan",
            input: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "DROLSKY", name: "DateTime", version: "1.55", qualifiers: ["repository_url": "backpan.perl.org"], subpath: nil),
            expected: "pkg:cpan/DROLSKY/DateTime@1.55?repository_url=backpan.perl.org"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cran: valid cran purl",
            input: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "A3", version: "0.9.1", qualifiers: [:], subpath: nil),
            expected: "pkg:cran/A3@0.9.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cran: invalid cran purl without name",
            input: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: nil, version: "0.9.1", qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "cran: Build test  for PURL type: cran",
            input: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "A3", version: "1.0.0", qualifiers: [:], subpath: nil),
            expected: "pkg:cran/A3@1.0.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cran: Build test  for PURL type: cran",
            input: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "rJava", version: "1.0-4", qualifiers: [:], subpath: nil),
            expected: "pkg:cran/rJava@1.0-4"
        ),
        ECMA_427.PURL.Test.Build(
            description: "cran: Build test  for PURL type: cran",
            input: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "caret", version: "6.0-88", qualifiers: [:], subpath: nil),
            expected: "pkg:cran/caret@6.0-88"
        ),
        ECMA_427.PURL.Test.Build(
            description: "deb: debian can use qualifiers",
            input: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "curl", version: "7.50.3-1", qualifiers: ["arch": "i386", "distro": "jessie"], subpath: nil),
            expected: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie"
        ),
        ECMA_427.PURL.Test.Build(
            description: "deb: Build test  for PURL type: deb",
            input: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "curl", version: "7.50.3-1", qualifiers: ["arch": "i386", "distro": "jessie"], subpath: nil),
            expected: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie"
        ),
        ECMA_427.PURL.Test.Build(
            description: "deb: Build test  for PURL type: deb",
            input: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "dpkg", version: "1.19.0.4", qualifiers: ["arch": "amd64", "distro": "stretch"], subpath: nil),
            expected: "pkg:deb/debian/dpkg@1.19.0.4?arch=amd64&distro=stretch"
        ),
        ECMA_427.PURL.Test.Build(
            description: "deb: Build test  for PURL type: deb",
            input: ECMA_427.PURL.Test.Components(type: "deb", namespace: "ubuntu", name: "dpkg", version: "1.19.0.4", qualifiers: ["arch": "amd64"], subpath: nil),
            expected: "pkg:deb/ubuntu/dpkg@1.19.0.4?arch=amd64"
        ),
        ECMA_427.PURL.Test.Build(
            description: "deb: Build test  for PURL type: deb",
            input: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "attr", version: "1:2.4.47-2", qualifiers: ["arch": "source"], subpath: nil),
            expected: "pkg:deb/debian/attr@1:2.4.47-2?arch=source"
        ),
        ECMA_427.PURL.Test.Build(
            description: "deb: Build test  for PURL type: deb",
            input: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "attr", version: "1:2.4.47-2+b1", qualifiers: ["arch": "amd64"], subpath: nil),
            expected: "pkg:deb/debian/attr@1:2.4.47-2%2Bb1?arch=amd64"
        ),
        ECMA_427.PURL.Test.Build(
            description: "docker: docker uses qualifiers and hash image id as versions",
            input: ECMA_427.PURL.Test.Components(
                type: "docker",
                namespace: "customer",
                name: "dockerimage",
                version: "sha256:244fd47e07d1004f0aed9c",
                qualifiers: ["repository_url": "gcr.io"],
                subpath: nil
            ),
            expected: "pkg:docker/customer/dockerimage@sha256:244fd47e07d1004f0aed9c?repository_url=gcr.io"
        ),
        ECMA_427.PURL.Test.Build(
            description: "docker: Build test  for PURL type: docker",
            input: ECMA_427.PURL.Test.Components(type: "docker", namespace: nil, name: "cassandra", version: "latest", qualifiers: [:], subpath: nil),
            expected: "pkg:docker/cassandra@latest"
        ),
        ECMA_427.PURL.Test.Build(
            description: "docker: Build test  for PURL type: docker",
            input: ECMA_427.PURL.Test.Components(type: "docker", namespace: "smartentry", name: "debian", version: "dc437cc87d10", qualifiers: [:], subpath: nil),
            expected: "pkg:docker/smartentry/debian@dc437cc87d10"
        ),
        ECMA_427.PURL.Test.Build(
            description: "docker: Build test  for PURL type: docker",
            input: ECMA_427.PURL.Test.Components(type: "docker", namespace: "customer", name: "dockerimage", version: "sha256:244fd47e07d10", qualifiers: ["repository_url": "gcr.io"], subpath: nil),
            expected: "pkg:docker/customer/dockerimage@sha256:244fd47e07d10?repository_url=gcr.io"
        ),
        ECMA_427.PURL.Test.Build(
            description: "gem: Ruby gems can use qualifiers",
            input: ECMA_427.PURL.Test.Components(type: "gem", namespace: nil, name: "jruby-launcher", version: "1.1.2", qualifiers: ["platform": "java"], subpath: nil),
            expected: "pkg:gem/jruby-launcher@1.1.2?platform=java"
        ),
        ECMA_427.PURL.Test.Build(
            description: "gem: Build test  for PURL type: gem",
            input: ECMA_427.PURL.Test.Components(type: "gem", namespace: nil, name: "ruby-advisory-db-check", version: "0.12.4", qualifiers: [:], subpath: nil),
            expected: "pkg:gem/ruby-advisory-db-check@0.12.4"
        ),
        ECMA_427.PURL.Test.Build(
            description: "gem: Build test  for PURL type: gem",
            input: ECMA_427.PURL.Test.Components(type: "gem", namespace: nil, name: "jruby-launcher", version: "1.1.2", qualifiers: ["platform": "java"], subpath: nil),
            expected: "pkg:gem/jruby-launcher@1.1.2?platform=java"
        ),
        ECMA_427.PURL.Test.Build(
            description: "generic: Build test  for PURL type: generic",
            input: ECMA_427.PURL.Test.Components(type: "generic", namespace: nil, name: "openssl", version: "1.1.10g", qualifiers: [:], subpath: nil),
            expected: "pkg:generic/openssl@1.1.10g"
        ),
        ECMA_427.PURL.Test.Build(
            description: "generic: Build test  for PURL type: generic",
            input: ECMA_427.PURL.Test.Components(
                type: "generic",
                namespace: nil,
                name: "openssl",
                version: "1.1.10g",
                qualifiers: ["checksum": "sha256:de4d501267da", "download_url": "https://openssl.org/source/openssl-1.1.0g.tar.gz"],
                subpath: nil
            ),
            expected: "pkg:generic/openssl@1.1.10g?checksum=sha256:de4d501267da&download_url=https:%2F%2Fopenssl.org%2Fsource%2Fopenssl-1.1.0g.tar.gz"
        ),
        ECMA_427.PURL.Test.Build(
            description: "generic: Build test  for PURL type: generic",
            input: ECMA_427.PURL.Test.Components(
                type: "generic",
                namespace: nil,
                name: "bitwarderl",
                version: nil,
                qualifiers: ["vcs_url": "git+https://git.fsfe.org/dxtr/bitwarderl@cc55108da32"],
                subpath: nil
            ),
            expected: "pkg:generic/bitwarderl?vcs_url=git%2Bhttps:%2F%2Fgit.fsfe.org%2Fdxtr%2Fbitwarderl%40cc55108da32"
        ),
        ECMA_427.PURL.Test.Build(
            description: "github: github namespace and name should be lowercased",
            input: ECMA_427.PURL.Test.Components(type: "github", namespace: "package-url", name: "purl-spec", version: "244fd47e07d1004f0aed9c", qualifiers: [:], subpath: nil),
            expected: "pkg:github/package-url/purl-spec@244fd47e07d1004f0aed9c"
        ),
        ECMA_427.PURL.Test.Build(
            description: "github: Build test  for PURL type: github",
            input: ECMA_427.PURL.Test.Components(type: "github", namespace: "package-url", name: "purl-spec", version: "244fd47e07d1004", qualifiers: [:], subpath: nil),
            expected: "pkg:github/package-url/purl-spec@244fd47e07d1004"
        ),
        ECMA_427.PURL.Test.Build(
            description: "github: Build test  for PURL type: github",
            input: ECMA_427.PURL.Test.Components(type: "github", namespace: "package-url", name: "purl-spec", version: "244fd47e07d1004", qualifiers: [:], subpath: "everybody/loves/dogs"),
            expected: "pkg:github/package-url/purl-spec@244fd47e07d1004#everybody/loves/dogs"
        ),
        ECMA_427.PURL.Test.Build(
            description: "golang: valid go purl without version and with subpath",
            input: ECMA_427.PURL.Test.Components(type: "golang", namespace: "google.golang.org", name: "genproto", version: nil, qualifiers: [:], subpath: "googleapis/api/annotations"),
            expected: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Build(
            description: "golang: valid go purl with version and subpath",
            input: ECMA_427.PURL.Test.Components(type: "golang", namespace: "google.golang.org", name: "genproto", version: "abcdedf", qualifiers: [:], subpath: "googleapis/api/annotations"),
            expected: "pkg:golang/google.golang.org/genproto@abcdedf#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Build(
            description: "golang: Build test  for PURL type: golang",
            input: ECMA_427.PURL.Test.Components(type: "golang", namespace: "github.com/gorilla", name: "context", version: "234fd47e07d1004f0aed9c", qualifiers: [:], subpath: nil),
            expected: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c"
        ),
        ECMA_427.PURL.Test.Build(
            description: "golang: Build test  for PURL type: golang",
            input: ECMA_427.PURL.Test.Components(type: "golang", namespace: "google.golang.org", name: "genproto", version: nil, qualifiers: [:], subpath: "googleapis/api/annotations"),
            expected: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Build(
            description: "golang: Build test  for PURL type: golang",
            input: ECMA_427.PURL.Test.Components(type: "golang", namespace: "github.com/gorilla", name: "context", version: "234fd47e07d1004f0aed9c", qualifiers: [:], subpath: "api"),
            expected: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c#api"
        ),
        ECMA_427.PURL.Test.Build(
            description: "hackage: valid hackage purl",
            input: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "AC-HalfInteger", version: "1.2.1", qualifiers: [:], subpath: nil),
            expected: "pkg:hackage/AC-HalfInteger@1.2.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "hackage: name and version are always required",
            input: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: nil, version: nil, qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "hackage: Build test  for PURL type: hackage",
            input: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "a50", version: "0.5", qualifiers: [:], subpath: nil),
            expected: "pkg:hackage/a50@0.5"
        ),
        ECMA_427.PURL.Test.Build(
            description: "hackage: Build test  for PURL type: hackage",
            input: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "AC-HalfInteger", version: "1.2.1", qualifiers: [:], subpath: nil),
            expected: "pkg:hackage/AC-HalfInteger@1.2.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "hackage: Build test  for PURL type: hackage",
            input: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "3d-graphics-examples", version: "0.0.0.2", qualifiers: [:], subpath: nil),
            expected: "pkg:hackage/3d-graphics-examples@0.0.0.2"
        ),
        ECMA_427.PURL.Test.Build(
            description: "hex: Build test  for PURL type: hex",
            input: ECMA_427.PURL.Test.Components(type: "hex", namespace: nil, name: "jason", version: "1.1.2", qualifiers: [:], subpath: nil),
            expected: "pkg:hex/jason@1.1.2"
        ),
        ECMA_427.PURL.Test.Build(
            description: "hex: Build test  for PURL type: hex",
            input: ECMA_427.PURL.Test.Components(type: "hex", namespace: "acme", name: "foo", version: "2.3.", qualifiers: [:], subpath: nil),
            expected: "pkg:hex/acme/foo@2.3."
        ),
        ECMA_427.PURL.Test.Build(
            description: "hex: Build test  for PURL type: hex",
            input: ECMA_427.PURL.Test.Components(type: "hex", namespace: nil, name: "phoenix_html", version: "2.13.3", qualifiers: [:], subpath: "priv/static/phoenix_html.js"),
            expected: "pkg:hex/phoenix_html@2.13.3#priv/static/phoenix_html.js"
        ),
        ECMA_427.PURL.Test.Build(
            description: "hex: Build test  for PURL type: hex",
            input: ECMA_427.PURL.Test.Components(type: "hex", namespace: nil, name: "bar", version: "1.2.3", qualifiers: ["repository_url": "https://myrepo.example.com"], subpath: nil),
            expected: "pkg:hex/bar@1.2.3?repository_url=https:%2F%2Fmyrepo.example.com"
        ),
        ECMA_427.PURL.Test.Build(
            description: "huggingface: minimal Hugging Face model",
            input: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: nil,
                name: "distilbert-base-uncased",
                version: "043235d6088ecd3dd5fb5ca3592b6913fd516027",
                qualifiers: [:],
                subpath: nil
            ),
            expected: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027"
        ),
        ECMA_427.PURL.Test.Build(
            description: "huggingface: Hugging Face model with staging endpoint",
            input: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: "microsoft",
                name: "deberta-v3-base",
                version: "559062ad13d311b87b2c455e67dcd5f1c8f65111",
                qualifiers: ["repository_url": "https://hub-ci.huggingface.co"],
                subpath: nil
            ),
            expected: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https:%2F%2Fhub-ci.huggingface.co"
        ),
        ECMA_427.PURL.Test.Build(
            description: "huggingface: Hugging Face model with various cases",
            input: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: "EleutherAI",
                name: "gpt-neo-1.3B",
                version: "797174552ae47f449ab70b684cabcb6603e5e85e",
                qualifiers: [:],
                subpath: nil
            ),
            expected: "pkg:huggingface/EleutherAI/gpt-neo-1.3B@797174552ae47f449ab70b684cabcb6603e5e85e"
        ),
        ECMA_427.PURL.Test.Build(
            description: "huggingface: Build test  for PURL type: huggingface",
            input: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: nil,
                name: "distilbert-base-uncased",
                version: "043235d6088ecd3dd5fb5ca3592b6913fd516027",
                qualifiers: [:],
                subpath: nil
            ),
            expected: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027"
        ),
        ECMA_427.PURL.Test.Build(
            description: "huggingface: Build test  for PURL type: huggingface",
            input: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: "microsoft",
                name: "deberta-v3-base",
                version: "559062ad13d311b87b2c455e67dcd5f1c8f65111",
                qualifiers: ["repository_url": "https://hub-ci.huggingface.co"],
                subpath: nil
            ),
            expected: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https:%2F%2Fhub-ci.huggingface.co"
        ),
        ECMA_427.PURL.Test.Build(
            description: "julia: valid julia purl build test - stdlib package with version and uuid",
            input: ECMA_427.PURL.Test.Components(type: "julia", namespace: nil, name: "Dates", version: "1.9.0", qualifiers: ["uuid": "ade2ca70-3891-5945-98fb-dc099432e06a"], subpath: nil),
            expected: "pkg:julia/Dates@1.9.0?uuid=ade2ca70-3891-5945-98fb-dc099432e06a"
        ),
        ECMA_427.PURL.Test.Build(
            description: "julia: valid julia purl build test with both qualifiers",
            input: ECMA_427.PURL.Test.Components(
                type: "julia",
                namespace: nil,
                name: "RegisterQD",
                version: "0.3.1",
                qualifiers: ["repository_url": "https://github.com/HolyLab/HolyLabRegistry", "uuid": "ac24ea0c-1830-11e9-18d4-81f172323054"],
                subpath: nil
            ),
            expected: "pkg:julia/RegisterQD@0.3.1?repository_url=https:%2F%2Fgithub.com%2FHolyLab%2FHolyLabRegistry&uuid=ac24ea0c-1830-11e9-18d4-81f172323054"
        ),
        ECMA_427.PURL.Test.Build(
            description: "julia: invalid julia purl build test - null name",
            input: ECMA_427.PURL.Test.Components(type: "julia", namespace: nil, name: nil, version: "1.9.0", qualifiers: ["uuid": "ade2ca70-3891-5945-98fb-dc099432e06a"], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "julia: invalid julia purl build test - empty name",
            input: ECMA_427.PURL.Test.Components(type: "julia", namespace: nil, name: "", version: "1.9.0", qualifiers: ["uuid": "ade2ca70-3891-5945-98fb-dc099432e06a"], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "luarocks: Build test  for PURL type: luarocks",
            input: ECMA_427.PURL.Test.Components(type: "luarocks", namespace: nil, name: "luasocket", version: "3.1.0-1", qualifiers: [:], subpath: nil),
            expected: "pkg:luarocks/luasocket@3.1.0-1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "luarocks: Build test  for PURL type: luarocks",
            input: ECMA_427.PURL.Test.Components(type: "luarocks", namespace: "hisham", name: "luafilesystem", version: "1.8.0-1", qualifiers: [:], subpath: nil),
            expected: "pkg:luarocks/hisham/luafilesystem@1.8.0-1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "luarocks: Build test  for PURL type: luarocks",
            input: ECMA_427.PURL.Test.Components(
                type: "luarocks",
                namespace: "username",
                name: "packagename",
                version: "0.1.0-1",
                qualifiers: ["repository_url": "https://example.com/private_rocks_server/"],
                subpath: nil
            ),
            expected: "pkg:luarocks/username/packagename@0.1.0-1?repository_url=https:%2F%2Fexample.com%2Fprivate_rocks_server%2F"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: valid maven purl",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: "1.3.4", qualifiers: [:], subpath: nil),
            expected: "pkg:maven/org.apache.commons/io@1.3.4"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: basic valid maven purl without version",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil),
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: maven often uses qualifiers",
            input: ECMA_427.PURL.Test.Components(
                type: "maven",
                namespace: "org.apache.xmlgraphics",
                name: "batik-anim",
                version: "1.9.1",
                qualifiers: ["classifier": "sources", "repository_url": "repo.spring.io/release"],
                subpath: nil
            ),
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources&repository_url=repo.spring.io%2Frelease"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: maven pom reference",
            input: ECMA_427.PURL.Test.Components(
                type: "maven",
                namespace: "org.apache.xmlgraphics",
                name: "batik-anim",
                version: "1.9.1",
                qualifiers: ["classifier": "foo", "repository_url": "repo.spring.io/release"],
                subpath: nil
            ),
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=foo&repository_url=repo.spring.io%2Frelease"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: maven can come with a type qualifier",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "net.sf.jacob-project", name: "jacob", version: "1.14.3", qualifiers: ["classifier": "x86", "type": "dll"], subpath: nil),
            expected: "pkg:maven/net.sf.jacob-project/jacob@1.14.3?classifier=x86&type=dll"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: slash / after type is not significant",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil),
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: double slash // after type is not significant",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil),
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: slash /// after type is not significant",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil),
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: valid maven purl with case sensitive namespace and name",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "HTTPClient", name: "HTTPClient", version: "0.3-3", qualifiers: [:], subpath: nil),
            expected: "pkg:maven/HTTPClient/HTTPClient@0.3-3"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: valid maven purl containing a space in the version and qualifier",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "mygroup", name: "myartifact", version: "1.0.0 Final", qualifiers: ["mykey": "my value"], subpath: nil),
            expected: "pkg:maven/mygroup/myartifact@1.0.0%20Final?mykey=my%20value"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: Build test  for PURL type: maven",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.xmlgraphics", name: "batik-anim", version: "1.9.1", qualifiers: [:], subpath: nil),
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: Build test  for PURL type: maven",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.xmlgraphics", name: "batik-anim", version: "1.9.1", qualifiers: ["type": "pom"], subpath: nil),
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=pom"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: Build test  for PURL type: maven",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.xmlgraphics", name: "batik-anim", version: "1.9.1", qualifiers: ["classifier": "sources"], subpath: nil),
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: Build test  for PURL type: maven",
            input: ECMA_427.PURL.Test.Components(
                type: "maven",
                namespace: "org.apache.xmlgraphics",
                name: "batik-anim",
                version: "1.9.1",
                qualifiers: ["classifier": "dist", "type": "zip"],
                subpath: nil
            ),
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=dist&type=zip"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: Build test  for PURL type: maven",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "net.sf.jacob-projec", name: "jacob", version: "1.14.3", qualifiers: ["classifier": "x86", "type": "dll"], subpath: nil),
            expected: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x86&type=dll"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: Build test  for PURL type: maven",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "net.sf.jacob-projec", name: "jacob", version: "1.14.3", qualifiers: ["classifier": "x64", "type": "dll"], subpath: nil),
            expected: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x64&type=dll"
        ),
        ECMA_427.PURL.Test.Build(
            description: "maven: Build test  for PURL type: maven",
            input: ECMA_427.PURL.Test.Components(type: "maven", namespace: "groovy", name: "groovy", version: "1.0", qualifiers: ["repository_url": "https://maven.google.com"], subpath: nil),
            expected: "pkg:maven/groovy/groovy@1.0?repository_url=https:%2F%2Fmaven.google.com"
        ),
        ECMA_427.PURL.Test.Build(
            description: "mlflow: MLflow model tracked in Azure Databricks (case insensitive)",
            input: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "creditfraud",
                version: "3",
                qualifiers: ["repository_url": "https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow"],
                subpath: nil
            ),
            expected: "pkg:mlflow/creditfraud@3?repository_url=https:%2F%2Fadb-5245952564735461.0.azuredatabricks.net%2Fapi%2F2.0%2Fmlflow"
        ),
        ECMA_427.PURL.Test.Build(
            description: "mlflow: MLflow model tracked in Azure ML (case sensitive)",
            input: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "CreditFraud",
                version: "3",
                qualifiers: [
                    "repository_url":
                        "https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace"
                ],
                subpath: nil
            ),
            expected:
                "pkg:mlflow/CreditFraud@3?repository_url=https:%2F%2Fwestus2.api.azureml.ms%2Fmlflow%2Fv1.0%2Fsubscriptions%2Fa50f2011-fab8-4164-af23-c62881ef8c95%2FresourceGroups%2FTestResourceGroup%2Fproviders%2FMicrosoft.MachineLearningServices%2Fworkspaces%2FTestWorkspace"
        ),
        ECMA_427.PURL.Test.Build(
            description: "mlflow: MLflow model with unique identifiers",
            input: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "trafficsigns",
                version: "10",
                qualifiers: [
                    "model_uuid": "36233173b22f4c89b451f1228d700d49", "run_id": "410a3121-2709-4f88-98dd-dba0ef056b0a",
                    "repository_url": "https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
                ],
                subpath: nil
            ),
            expected:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&repository_url=https:%2F%2Fadb-5245952564735461.0.azuredatabricks.net%2Fapi%2F2.0%2Fmlflow&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a"
        ),
        ECMA_427.PURL.Test.Build(
            description: "mlflow: Build test  for PURL type: mlflow",
            input: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "creditfraud",
                version: "3",
                qualifiers: [
                    "repository_url":
                        "https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace"
                ],
                subpath: nil
            ),
            expected:
                "pkg:mlflow/creditfraud@3?repository_url=https:%2F%2Fwestus2.api.azureml.ms%2Fmlflow%2Fv1.0%2Fsubscriptions%2Fa50f2011-fab8-4164-af23-c62881ef8c95%2FresourceGroups%2FTestResourceGroup%2Fproviders%2FMicrosoft.MachineLearningServices%2Fworkspaces%2FTestWorkspace"
        ),
        ECMA_427.PURL.Test.Build(
            description: "mlflow: Build test for PURL type: mlflow",
            input: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "trafficsigns",
                version: "10",
                qualifiers: [
                    "model_uuid": "36233173b22f4c89b451f1228d700d49", "repository_url": "https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
                    "run_id": "410a3121-2709-4f88-98dd-dba0ef056b0a",
                ],
                subpath: nil
            ),
            expected:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&repository_url=https:%2F%2Fadb-5245952564735461.0.azuredatabricks.net%2Fapi%2F2.0%2Fmlflow&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a"
        ),
        ECMA_427.PURL.Test.Build(
            description: "npm: npm can be scoped",
            input: ECMA_427.PURL.Test.Components(type: "npm", namespace: "@angular", name: "animation", version: "12.3.1", qualifiers: [:], subpath: nil),
            expected: "pkg:npm/%40angular/animation@12.3.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "npm: Build test  for PURL type: npm",
            input: ECMA_427.PURL.Test.Components(type: "npm", namespace: nil, name: "foobar", version: "12.3.1", qualifiers: [:], subpath: nil),
            expected: "pkg:npm/foobar@12.3.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "npm: Build test  for PURL type: npm",
            input: ECMA_427.PURL.Test.Components(type: "npm", namespace: "@angular", name: "animation", version: "12.3.1", qualifiers: [:], subpath: nil),
            expected: "pkg:npm/%40angular/animation@12.3.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "npm: Build test for PURL type: npm",
            input: ECMA_427.PURL.Test.Components(
                type: "npm",
                namespace: nil,
                name: "mypackage",
                version: "12.4.5",
                qualifiers: ["vcs_url": "git://host.com/path/to/repo.git@4345abcd34343"],
                subpath: nil
            ),
            expected: "pkg:npm/mypackage@12.4.5?vcs_url=git:%2F%2Fhost.com%2Fpath%2Fto%2Frepo.git%404345abcd34343"
        ),
        ECMA_427.PURL.Test.Build(
            description: "nuget: nuget names are case sensitive",
            input: ECMA_427.PURL.Test.Components(type: "nuget", namespace: nil, name: "EnterpriseLibrary.Common", version: "6.0.1304", qualifiers: [:], subpath: nil),
            expected: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304"
        ),
        ECMA_427.PURL.Test.Build(
            description: "nuget: Build test  for PURL type: nuget",
            input: ECMA_427.PURL.Test.Components(type: "nuget", namespace: nil, name: "EnterpriseLibrary.Common", version: "6.0.1304", qualifiers: [:], subpath: nil),
            expected: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304"
        ),
        ECMA_427.PURL.Test.Build(
            description: "oci: Build test for PURL type: oci",
            input: ECMA_427.PURL.Test.Components(
                type: "oci",
                namespace: nil,
                name: "debian",
                version: "sha256:244fd47e07d10",
                qualifiers: ["arch": "amd64", "repository_url": "docker.io/library/debian", "tag": "latest"],
                subpath: nil
            ),
            expected: "pkg:oci/debian@sha256:244fd47e07d10?arch=amd64&repository_url=docker.io%2Flibrary%2Fdebian&tag=latest"
        ),
        ECMA_427.PURL.Test.Build(
            description: "oci: Build test for PURL type: oci",
            input: ECMA_427.PURL.Test.Components(
                type: "oci",
                namespace: nil,
                name: "debian",
                version: "sha256:244fd47e07d10",
                qualifiers: ["repository_url": "ghcr.io/debian", "tag": "bullseye"],
                subpath: nil
            ),
            expected: "pkg:oci/debian@sha256:244fd47e07d10?repository_url=ghcr.io%2Fdebian&tag=bullseye"
        ),
        ECMA_427.PURL.Test.Build(
            description: "oci: Build test  for PURL type: oci",
            input: ECMA_427.PURL.Test.Components(
                type: "oci",
                namespace: nil,
                name: "static",
                version: "sha256:244fd47e07d10",
                qualifiers: ["repository_url": "gcr.io/distroless/static", "tag": "latest"],
                subpath: nil
            ),
            expected: "pkg:oci/static@sha256:244fd47e07d10?repository_url=gcr.io%2Fdistroless%2Fstatic&tag=latest"
        ),
        ECMA_427.PURL.Test.Build(
            description: "oci: Build test  for PURL type: oci",
            input: ECMA_427.PURL.Test.Components(type: "oci", namespace: nil, name: "hello-wasm", version: "sha256:244fd47e07d10", qualifiers: ["tag": "v1"], subpath: nil),
            expected: "pkg:oci/hello-wasm@sha256:244fd47e07d10?tag=v1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "otp: Build test  for <class 'type'> PURL",
            input: ECMA_427.PURL.Test.Components(
                type: "otp",
                namespace: nil,
                name: "asn1",
                version: "5.4.1",
                qualifiers: ["platform": "linux", "arch": "amd64", "repository_url": "https://github.com/erlang/otp", "vcs_url": "git+https://github.com/erlang/otp.git"],
                subpath: "src/asn1ct.erl"
            ),
            expected: "pkg:otp/asn1@5.4.1?arch=amd64&platform=linux&repository_url=https:%2F%2Fgithub.com%2Ferlang%2Fotp&vcs_url=git%2Bhttps:%2F%2Fgithub.com%2Ferlang%2Fotp.git#src/asn1ct.erl"
        ),
        ECMA_427.PURL.Test.Build(
            description: "otp: Build test  for <class 'type'> PURL",
            input: ECMA_427.PURL.Test.Components(type: "otp", namespace: nil, name: "hex", version: "2.1.1", qualifiers: [:], subpath: nil),
            expected: "pkg:otp/hex@2.1.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "pub: Build test  for PURL type: pub",
            input: ECMA_427.PURL.Test.Components(type: "pub", namespace: nil, name: "characters", version: "1.2.0", qualifiers: [:], subpath: nil),
            expected: "pkg:pub/characters@1.2.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "pub: Build test  for PURL type: pub",
            input: ECMA_427.PURL.Test.Components(type: "pub", namespace: nil, name: "flutter", version: "0.0.0", qualifiers: [:], subpath: nil),
            expected: "pkg:pub/flutter@0.0.0"
        ),
        ECMA_427.PURL.Test.Build(
            description: "pypi: pypi names have special rules and not case sensitive",
            input: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django-package", version: "1.11.1.dev1", qualifiers: [:], subpath: nil),
            expected: "pkg:pypi/django-package@1.11.1.dev1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "pypi: Build test  for PURL type: pypi",
            input: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django", version: "1.11.1", qualifiers: [:], subpath: nil),
            expected: "pkg:pypi/django@1.11.1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "pypi: Build test  for PURL type: pypi",
            input: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django", version: "1.11.1", qualifiers: ["file_name": "Django-1.11.1.tar.gz"], subpath: nil),
            expected: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1.tar.gz"
        ),
        ECMA_427.PURL.Test.Build(
            description: "pypi: Build test  for PURL type: pypi",
            input: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django", version: "1.11.1", qualifiers: ["file_name": "Django-1.11.1-py2.py3-none-any.whl"], subpath: nil),
            expected: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1-py2.py3-none-any.whl"
        ),
        ECMA_427.PURL.Test.Build(
            description: "pypi: Build test  for PURL type: pypi",
            input: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django-allauth", version: "12.23", qualifiers: [:], subpath: nil),
            expected: "pkg:pypi/django-allauth@12.23"
        ),
        ECMA_427.PURL.Test.Build(
            description: "qpkg: Build test  for PURL type: qpkg",
            input: ECMA_427.PURL.Test.Components(type: "qpkg", namespace: "blackberry", name: "com.qnx.sdp", version: "7.0.0.SGA201702151847", qualifiers: [:], subpath: nil),
            expected: "pkg:qpkg/blackberry/com.qnx.sdp@7.0.0.SGA201702151847"
        ),
        ECMA_427.PURL.Test.Build(
            description: "qpkg: Build test  for PURL type: qpkg",
            input: ECMA_427.PURL.Test.Components(type: "qpkg", namespace: "blackberry", name: "com.qnx.qnx710.foo.bar.qux", version: "0.0.4.01449T202205040833L", qualifiers: [:], subpath: nil),
            expected: "pkg:qpkg/blackberry/com.qnx.qnx710.foo.bar.qux@0.0.4.01449T202205040833L"
        ),
        ECMA_427.PURL.Test.Build(
            description: "rpm: rpm often use qualifiers",
            input: ECMA_427.PURL.Test.Components(type: "rpm", namespace: "fedora", name: "curl", version: "7.50.3-1.fc25", qualifiers: ["arch": "i386", "distro": "fedora-25"], subpath: nil),
            expected: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25"
        ),
        ECMA_427.PURL.Test.Build(
            description: "rpm: Build test  for PURL type: rpm",
            input: ECMA_427.PURL.Test.Components(type: "rpm", namespace: "fedora", name: "curl", version: "7.50.3-1.fc25", qualifiers: ["arch": "i386", "distro": "fedora-25"], subpath: nil),
            expected: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25"
        ),
        ECMA_427.PURL.Test.Build(
            description: "rpm: Build test  for PURL type: rpm",
            input: ECMA_427.PURL.Test.Components(
                type: "rpm",
                namespace: "fedora",
                name: "centerim",
                version: "4.22.10-1.el6",
                qualifiers: ["arch": "i686", "distro": "fedora-25", "epoch": "1"],
                subpath: nil
            ),
            expected: "pkg:rpm/fedora/centerim@4.22.10-1.el6?arch=i686&distro=fedora-25&epoch=1"
        ),
        ECMA_427.PURL.Test.Build(
            description: "swid: Build test  for PURL type: swid",
            input: ECMA_427.PURL.Test.Components(
                type: "swid",
                namespace: "Acme/example.com",
                name: "Enterprise+Server",
                version: "1.0.0",
                qualifiers: ["tag_id": "75b8c285-fa7b-485b-b199-4745e3004d0d"],
                subpath: nil
            ),
            expected: "pkg:swid/Acme/example.com/Enterprise%2BServer@1.0.0?tag_id=75b8c285-fa7b-485b-b199-4745e3004d0d"
        ),
        ECMA_427.PURL.Test.Build(
            description: "swid: Build test  for PURL type: swid",
            input: ECMA_427.PURL.Test.Components(type: "swid", namespace: nil, name: "Fedora", version: "29", qualifiers: ["tag_id": "org.fedoraproject.Fedora-29"], subpath: nil),
            expected: "pkg:swid/Fedora@29?tag_id=org.fedoraproject.Fedora-29"
        ),
        ECMA_427.PURL.Test.Build(
            description: "swid: Build test  for PURL type: swid",
            input: ECMA_427.PURL.Test.Components(
                type: "swid",
                namespace: "Adobe+Systems+Incorporated",
                name: "Adobe+InDesign",
                version: "CC",
                qualifiers: ["tag_id": "CreativeCloud-CS6-Win-GM-MUL"],
                subpath: nil
            ),
            expected: "pkg:swid/Adobe%2BSystems%2BIncorporated/Adobe%2BInDesign@CC?tag_id=CreativeCloud-CS6-Win-GM-MUL"
        ),
        ECMA_427.PURL.Test.Build(
            description: "swift: valid swift purl",
            input: ECMA_427.PURL.Test.Components(type: "swift", namespace: "github.com/Alamofire", name: "Alamofire", version: "5.4.3", qualifiers: [:], subpath: nil),
            expected: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3"
        ),
        ECMA_427.PURL.Test.Build(
            description: "swift: invalid swift purl without name",
            input: ECMA_427.PURL.Test.Components(type: "swift", namespace: "github.com/Alamofire", name: nil, version: "5.4.3", qualifiers: [:], subpath: nil),
            expected: nil
        ),
        ECMA_427.PURL.Test.Build(
            description: "swift: Build test  for PURL type: swift",
            input: ECMA_427.PURL.Test.Components(type: "swift", namespace: "github.com/Alamofire", name: "Alamofire", version: "5.4.3", qualifiers: [:], subpath: nil),
            expected: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3"
        ),
        ECMA_427.PURL.Test.Build(
            description: "swift: Build test  for PURL type: swift",
            input: ECMA_427.PURL.Test.Components(type: "swift", namespace: "github.com/RxSwiftCommunity", name: "RxFlow", version: "2.12.4", qualifiers: [:], subpath: nil),
            expected: "pkg:swift/github.com/RxSwiftCommunity/RxFlow@2.12.4"
        ),
    ]
}
