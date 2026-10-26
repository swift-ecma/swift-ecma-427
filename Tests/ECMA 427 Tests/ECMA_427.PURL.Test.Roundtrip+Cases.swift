// Transliterated from the purl-spec v1.0.0 test suite (package-url/purl-spec, tests/spec and tests/types), MIT.
// Cases whose expectation rests on a type definition rather than on ECMA-427 Clause 5 are left out.
import ECMA_427

extension ECMA_427.PURL.Test.Roundtrip {
    static let cases: [ECMA_427.PURL.Test.Roundtrip] = [
        ECMA_427.PURL.Test.Roundtrip(
            description: "specification: Roundtrip with multiple checksum",
            input: "pkg:generic/bitwarderl?checksum=sha1:ad9503c3e994a4f%2Csha256:41bf9088b3a1e6c1ef1d",
            expected: "pkg:generic/bitwarderl?checksum=sha1:ad9503c3e994a4f%2Csha256:41bf9088b3a1e6c1ef1d"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "alpm: Roundtrip test for PURL type: alpm", input: "pkg:alpm/arch/pacman@6.0.1-1?arch=x86_64", expected: "pkg:alpm/arch/pacman@6.0.1-1?arch=x86_64"),
        ECMA_427.PURL.Test.Roundtrip(description: "alpm: Roundtrip test for PURL type: alpm", input: "pkg:alpm/arch/python-pip@21.0-1?arch=any", expected: "pkg:alpm/arch/python-pip@21.0-1?arch=any"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "alpm: Roundtrip test for PURL type: alpm",
            input: "pkg:alpm/arch/containers-common@1:0.47.4-4?arch=x86_64",
            expected: "pkg:alpm/arch/containers-common@1:0.47.4-4?arch=x86_64"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "apk: Roundtrip test for PURL type: apk", input: "pkg:apk/alpine/curl@7.83.0-r0?arch=x86", expected: "pkg:apk/alpine/curl@7.83.0-r0?arch=x86"),
        ECMA_427.PURL.Test.Roundtrip(description: "apk: Roundtrip test for PURL type: apk", input: "pkg:apk/alpine/apk@2.12.9-r3?arch=x86", expected: "pkg:apk/alpine/apk@2.12.9-r3?arch=x86"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bazel: bazel module with default registry",
            input: "pkg:bazel/rules_java@7.8.0?repository_url=https://bcr.bazel.build/",
            expected: "pkg:bazel/rules_java@7.8.0?repository_url=https:%2F%2Fbcr.bazel.build%2F"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bazel: bazel module with custom registry",
            input: "pkg:bazel/rules_java@7.8.0?repository_url=https://example.org/bazel-registry/",
            expected: "pkg:bazel/rules_java@7.8.0?repository_url=https:%2F%2Fexample.org%2Fbazel-registry%2F"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "bazel: bazel module with relaxed semver version", input: "pkg:bazel/curl@8.8.0.bcr.1", expected: "pkg:bazel/curl@8.8.0.bcr.1"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bazel: bazel module names are actually all lowercased, but this is not enforced by the PURL type spec for reasons",
            input: "pkg:bazel/Curl@8.8.0.bcr.1",
            expected: "pkg:bazel/Curl@8.8.0.bcr.1"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bazel: bazel module with multi-segment package",
            input: "pkg:bazel/rules_java@8.5.0#java/runfiles",
            expected: "pkg:bazel/rules_java@8.5.0#java/runfiles"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bazel: bazel module with target reference",
            input: "pkg:bazel/rules_java@8.5.0#java/runfiles:runfiles",
            expected: "pkg:bazel/rules_java@8.5.0#java/runfiles:runfiles"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "bazel: bazel module with single-segment package", input: "pkg:bazel/rules_go@0.48.0#go", expected: "pkg:bazel/rules_go@0.48.0#go"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bitbucket: bitbucket namespace and name should be lowercased. Roundtrip a canonical input to canonical output.",
            input: "pkg:bitbucket/birkenfeld/pygments-main@244fd47e07d1014f0aed9c",
            expected: "pkg:bitbucket/birkenfeld/pygments-main@244fd47e07d1014f0aed9c"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bitbucket: Roundtrip test for PURL type: bitbucket",
            input: "pkg:bitbucket/birkenfeld/pygments-main@244fd47e07d1014f0aed9c",
            expected: "pkg:bitbucket/birkenfeld/pygments-main@244fd47e07d1014f0aed9c"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bitnami: Roundtrip test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress?distro=debian-12",
            expected: "pkg:bitnami/wordpress?distro=debian-12"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bitnami: Roundtrip test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress@6.2.0?distro=debian-12",
            expected: "pkg:bitnami/wordpress@6.2.0?distro=debian-12"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bitnami: Roundtrip test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=debian-12",
            expected: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=debian-12"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "bitnami: Roundtrip test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=photon-4",
            expected: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=photon-4"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "cargo: Roundtrip test for PURL type: cargo", input: "pkg:cargo/rand@0.7.2", expected: "pkg:cargo/rand@0.7.2"),
        ECMA_427.PURL.Test.Roundtrip(description: "cargo: Roundtrip test for PURL type: cargo", input: "pkg:cargo/clap@2.33.0", expected: "pkg:cargo/clap@2.33.0"),
        ECMA_427.PURL.Test.Roundtrip(description: "cargo: Roundtrip test for PURL type: cargo", input: "pkg:cargo/structopt@0.3.11", expected: "pkg:cargo/structopt@0.3.11"),
        ECMA_427.PURL.Test.Roundtrip(description: "cocoapods: Roundtrip test for PURL type: cocoapods", input: "pkg:cocoapods/AFNetworking@4.0.1", expected: "pkg:cocoapods/AFNetworking@4.0.1"),
        ECMA_427.PURL.Test.Roundtrip(description: "cocoapods: Roundtrip test for PURL type: cocoapods", input: "pkg:cocoapods/MapsIndoors@3.24.0", expected: "pkg:cocoapods/MapsIndoors@3.24.0"),
        ECMA_427.PURL.Test.Roundtrip(description: "cocoapods: Roundtrip test for PURL type: cocoapods", input: "pkg:cocoapods/ShareKit@2.0#Twitter", expected: "pkg:cocoapods/ShareKit@2.0#Twitter"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "cocoapods: Roundtrip test for PURL type: cocoapods",
            input: "pkg:cocoapods/GoogleUtilities@7.5.2#NSData+zlib",
            expected: "pkg:cocoapods/GoogleUtilities@7.5.2#NSData%2Bzlib"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "composer: valid packagist purl", input: "pkg:composer/guzzlehttp/promises@2.0.2", expected: "pkg:composer/guzzlehttp/promises@2.0.2"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "composer: composer names are not case sensitive. Roundtrip a canonical input to canonical output.",
            input: "pkg:composer/laravel/laravel@5.5.0",
            expected: "pkg:composer/laravel/laravel@5.5.0"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "composer: Roundtrip test for PURL type: composer", input: "pkg:composer/laravel/laravel@5.5.0", expected: "pkg:composer/laravel/laravel@5.5.0"),
        ECMA_427.PURL.Test.Roundtrip(description: "conan: valid conan purl. Roundtrip an input purl to canonical.", input: "pkg:conan/cctz@2.3", expected: "pkg:conan/cctz@2.3"),
        ECMA_427.PURL.Test.Roundtrip(description: "conan: valid conan purl. Roundtrip a canonical input to canonical output.", input: "pkg:conan/cctz@2.3", expected: "pkg:conan/cctz@2.3"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "conan: valid conan purl with namespace and qualifier channel. Roundtrip an input purl to canonical.",
            input: "pkg:conan/bincrafters/cctz@2.3?channel=stable",
            expected: "pkg:conan/bincrafters/cctz@2.3?channel=stable"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "conan: valid conan purl with namespace and qualifier channel. Roundtrip a canonical input to canonical output.",
            input: "pkg:conan/bincrafters/cctz@2.3?channel=stable",
            expected: "pkg:conan/bincrafters/cctz@2.3?channel=stable"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "conan: Roundtrip test for PURL type: conan", input: "pkg:conan/openssl@3.0.3", expected: "pkg:conan/openssl@3.0.3"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "conan: Roundtrip test for PURL type: conan",
            input: "pkg:conan/openssl.org/openssl@3.0.3?user=bincrafters&channel=stable",
            expected: "pkg:conan/openssl.org/openssl@3.0.3?channel=stable&user=bincrafters"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "conan: Roundtrip test for PURL type: conan",
            input:
                "pkg:conan/openssl.org/openssl@3.0.3?arch=x86_64&build_type=Debug&compiler=Visual%20Studio&compiler.runtime=MDd&compiler.version=16&os=Windows&shared=True&rrev=93a82349c31917d2d674d22065c7a9ef9f380c8e&prev=b429db8a0e324114c25ec387bfd8281f330d7c5c",
            expected:
                "pkg:conan/openssl.org/openssl@3.0.3?arch=x86_64&build_type=Debug&compiler=Visual%20Studio&compiler.runtime=MDd&compiler.version=16&os=Windows&prev=b429db8a0e324114c25ec387bfd8281f330d7c5c&rrev=93a82349c31917d2d674d22065c7a9ef9f380c8e&shared=True"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "conda: valid conda purl with qualifiers. Roundtrip an input purl to canonical.",
            input: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2",
            expected: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "conda: valid conda purl with qualifiers. Roundtrip a canonical input to canonical output.",
            input: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2",
            expected: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "conda: Roundtrip test for PURL type: conda",
            input: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2",
            expected: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "cpan: CPAN distribution name are case sensitive. Roundtrip an input purl to canonical.",
            input: "pkg:cpan/DROLSKY/DateTime@1.55",
            expected: "pkg:cpan/DROLSKY/DateTime@1.55"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "cpan: CPAN distribution name are case sensitive. Roundtrip a canonical input to canonical output.",
            input: "pkg:cpan/DROLSKY/DateTime@1.55",
            expected: "pkg:cpan/DROLSKY/DateTime@1.55"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "cpan: Roundtrip test for PURL type: cpan", input: "pkg:cpan/DROLSKY/DateTime@1.55", expected: "pkg:cpan/DROLSKY/DateTime@1.55"),
        ECMA_427.PURL.Test.Roundtrip(description: "cpan: Roundtrip test for PURL type: cpan", input: "pkg:cpan/GDT/URI-PackageURL", expected: "pkg:cpan/GDT/URI-PackageURL"),
        ECMA_427.PURL.Test.Roundtrip(description: "cpan: Roundtrip test for PURL type: cpan", input: "pkg:cpan/OALDERS/libwww-perl@6.76", expected: "pkg:cpan/OALDERS/libwww-perl@6.76"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "cpan: Roundtrip test for PURL type: cpan",
            input: "pkg:cpan/DROLSKY/DateTime@1.55?repository_url=backpan.perl.org",
            expected: "pkg:cpan/DROLSKY/DateTime@1.55?repository_url=backpan.perl.org"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "cran: valid cran purl. Roundtrip an input purl to canonical.", input: "pkg:cran/A3@0.9.1", expected: "pkg:cran/A3@0.9.1"),
        ECMA_427.PURL.Test.Roundtrip(description: "cran: valid cran purl. Roundtrip a canonical input to canonical output.", input: "pkg:cran/A3@0.9.1", expected: "pkg:cran/A3@0.9.1"),
        ECMA_427.PURL.Test.Roundtrip(description: "cran: Roundtrip test for PURL type: cran", input: "pkg:cran/A3@1.0.0", expected: "pkg:cran/A3@1.0.0"),
        ECMA_427.PURL.Test.Roundtrip(description: "cran: Roundtrip test for PURL type: cran", input: "pkg:cran/rJava@1.0-4", expected: "pkg:cran/rJava@1.0-4"),
        ECMA_427.PURL.Test.Roundtrip(description: "cran: Roundtrip test for PURL type: cran", input: "pkg:cran/caret@6.0-88", expected: "pkg:cran/caret@6.0-88"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "deb: debian can use qualifiers. Roundtrip an input purl to canonical.",
            input: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie",
            expected: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "deb: debian can use qualifiers. Roundtrip a canonical input to canonical output.",
            input: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie",
            expected: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "deb: Roundtrip test for PURL type: deb",
            input: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie",
            expected: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "deb: Roundtrip test for PURL type: deb",
            input: "pkg:deb/debian/dpkg@1.19.0.4?arch=amd64&distro=stretch",
            expected: "pkg:deb/debian/dpkg@1.19.0.4?arch=amd64&distro=stretch"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "deb: Roundtrip test for PURL type: deb", input: "pkg:deb/ubuntu/dpkg@1.19.0.4?arch=amd64", expected: "pkg:deb/ubuntu/dpkg@1.19.0.4?arch=amd64"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "deb: Roundtrip test for PURL type: deb",
            input: "pkg:deb/debian/attr@1:2.4.47-2?arch=source",
            expected: "pkg:deb/debian/attr@1:2.4.47-2?arch=source"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "deb: Roundtrip test for PURL type: deb",
            input: "pkg:deb/debian/attr@1:2.4.47-2%2Bb1?arch=amd64",
            expected: "pkg:deb/debian/attr@1:2.4.47-2%2Bb1?arch=amd64"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "docker: docker uses qualifiers and hash image id as versions. Roundtrip an input purl wrongly percent encoded to canonical.",
            input: "pkg:docker/customer/dockerimage@sha256%3A244fd47e07d1004f0aed9c?repository_url=gcr.io",
            expected: "pkg:docker/customer/dockerimage@sha256:244fd47e07d1004f0aed9c?repository_url=gcr.io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "docker: docker uses qualifiers and hash image id as versions. Roundtrip a canonical input to canonical output.",
            input: "pkg:docker/customer/dockerimage@sha256:244fd47e07d1004f0aed9c?repository_url=gcr.io",
            expected: "pkg:docker/customer/dockerimage@sha256:244fd47e07d1004f0aed9c?repository_url=gcr.io"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "docker: Roundtrip test for PURL type: docker", input: "pkg:docker/cassandra@latest", expected: "pkg:docker/cassandra@latest"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "docker: Roundtrip test for PURL type: docker",
            input: "pkg:docker/smartentry/debian@dc437cc87d10",
            expected: "pkg:docker/smartentry/debian@dc437cc87d10"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "docker: Roundtrip test for PURL type: docker",
            input: "pkg:docker/customer/dockerimage@sha256:244fd47e07d10?repository_url=gcr.io",
            expected: "pkg:docker/customer/dockerimage@sha256:244fd47e07d10?repository_url=gcr.io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "gem: Ruby gems can use qualifiers. Roundtrip an input purl to canonical.",
            input: "pkg:gem/jruby-launcher@1.1.2?Platform=java",
            expected: "pkg:gem/jruby-launcher@1.1.2?platform=java"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "gem: Ruby gems can use qualifiers. Roundtrip a canonical input to canonical output.",
            input: "pkg:gem/jruby-launcher@1.1.2?platform=java",
            expected: "pkg:gem/jruby-launcher@1.1.2?platform=java"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "gem: Roundtrip test for PURL type: gem", input: "pkg:gem/ruby-advisory-db-check@0.12.4", expected: "pkg:gem/ruby-advisory-db-check@0.12.4"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "gem: Roundtrip test for PURL type: gem",
            input: "pkg:gem/jruby-launcher@1.1.2?platform=java",
            expected: "pkg:gem/jruby-launcher@1.1.2?platform=java"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "generic: Roundtrip test for PURL type: generic", input: "pkg:generic/openssl@1.1.10g", expected: "pkg:generic/openssl@1.1.10g"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "generic: Roundtrip test for PURL type: generic",
            input: "pkg:generic/openssl@1.1.10g?download_url=https://openssl.org/source/openssl-1.1.0g.tar.gz&checksum=sha256:de4d501267da",
            expected: "pkg:generic/openssl@1.1.10g?checksum=sha256:de4d501267da&download_url=https:%2F%2Fopenssl.org%2Fsource%2Fopenssl-1.1.0g.tar.gz"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "generic: Roundtrip test for PURL type: generic",
            input: "pkg:generic/bitwarderl?vcs_url=git%2Bhttps://git.fsfe.org/dxtr/bitwarderl%40cc55108da32",
            expected: "pkg:generic/bitwarderl?vcs_url=git%2Bhttps:%2F%2Fgit.fsfe.org%2Fdxtr%2Fbitwarderl%40cc55108da32"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "github: github namespace and name should be lowercased. Roundtrip a canonical input to canonical output.",
            input: "pkg:github/package-url/purl-spec@244fd47e07d1004f0aed9c",
            expected: "pkg:github/package-url/purl-spec@244fd47e07d1004f0aed9c"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "github: Roundtrip test for PURL type: github",
            input: "pkg:github/package-url/purl-spec@244fd47e07d1004",
            expected: "pkg:github/package-url/purl-spec@244fd47e07d1004"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "github: Roundtrip test for PURL type: github",
            input: "pkg:github/package-url/purl-spec@244fd47e07d1004#everybody/loves/dogs",
            expected: "pkg:github/package-url/purl-spec@244fd47e07d1004#everybody/loves/dogs"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "golang: valid go purl without version and with subpath. Roundtrip an input purl to canonical.",
            input: "pkg:GOLANG/google.golang.org/genproto#/googleapis/api/annotations/",
            expected: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "golang: valid go purl without version and with subpath. Roundtrip a canonical input to canonical output.",
            input: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations",
            expected: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "golang: valid go purl with version and subpath. Roundtrip an input purl to canonical.",
            input: "pkg:GOLANG/google.golang.org/genproto@abcdedf#/googleapis/api/annotations/",
            expected: "pkg:golang/google.golang.org/genproto@abcdedf#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "golang: valid go purl with version and subpath. Roundtrip a canonical input to canonical output.",
            input: "pkg:golang/google.golang.org/genproto@abcdedf#googleapis/api/annotations",
            expected: "pkg:golang/google.golang.org/genproto@abcdedf#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "golang: Roundtrip test for PURL type: golang",
            input: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c",
            expected: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "golang: Roundtrip test for PURL type: golang",
            input: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations",
            expected: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "golang: Roundtrip test for PURL type: golang",
            input: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c#api",
            expected: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c#api"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "hackage: valid hackage purl. Roundtrip an input purl to canonical.",
            input: "pkg:hackage/AC-HalfInteger@1.2.1",
            expected: "pkg:hackage/AC-HalfInteger@1.2.1"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "hackage: valid hackage purl. Roundtrip a canonical input to canonical output.",
            input: "pkg:hackage/AC-HalfInteger@1.2.1",
            expected: "pkg:hackage/AC-HalfInteger@1.2.1"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "hackage: Roundtrip test for PURL type: hackage", input: "pkg:hackage/a50@0.5", expected: "pkg:hackage/a50@0.5"),
        ECMA_427.PURL.Test.Roundtrip(description: "hackage: Roundtrip test for PURL type: hackage", input: "pkg:hackage/AC-HalfInteger@1.2.1", expected: "pkg:hackage/AC-HalfInteger@1.2.1"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "hackage: Roundtrip test for PURL type: hackage",
            input: "pkg:hackage/3d-graphics-examples@0.0.0.2",
            expected: "pkg:hackage/3d-graphics-examples@0.0.0.2"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "hex: Roundtrip test for PURL type: hex", input: "pkg:hex/jason@1.1.2", expected: "pkg:hex/jason@1.1.2"),
        ECMA_427.PURL.Test.Roundtrip(description: "hex: Roundtrip test for PURL type: hex", input: "pkg:hex/acme/foo@2.3.", expected: "pkg:hex/acme/foo@2.3."),
        ECMA_427.PURL.Test.Roundtrip(
            description: "hex: Roundtrip test for PURL type: hex",
            input: "pkg:hex/phoenix_html@2.13.3#priv/static/phoenix_html.js",
            expected: "pkg:hex/phoenix_html@2.13.3#priv/static/phoenix_html.js"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "hex: Roundtrip test for PURL type: hex",
            input: "pkg:hex/bar@1.2.3?repository_url=https://myrepo.example.com",
            expected: "pkg:hex/bar@1.2.3?repository_url=https:%2F%2Fmyrepo.example.com"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "huggingface: minimal Hugging Face model. Roundtrip an input purl to canonical.",
            input: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027",
            expected: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "huggingface: minimal Hugging Face model. Roundtrip a canonical input to canonical output.",
            input: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027",
            expected: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "huggingface: Hugging Face model with staging endpoint. Roundtrip an input purl to canonical.",
            input: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https://hub-ci.huggingface.co",
            expected: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https:%2F%2Fhub-ci.huggingface.co"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "huggingface: Hugging Face model with staging endpoint. Roundtrip a canonical input to canonical output.",
            input: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https://hub-ci.huggingface.co",
            expected: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https:%2F%2Fhub-ci.huggingface.co"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "huggingface: Hugging Face model with various cases. Roundtrip a canonical input to canonical output.",
            input: "pkg:huggingface/EleutherAI/gpt-neo-1.3B@797174552ae47f449ab70b684cabcb6603e5e85e",
            expected: "pkg:huggingface/EleutherAI/gpt-neo-1.3B@797174552ae47f449ab70b684cabcb6603e5e85e"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "huggingface: Roundtrip test for PURL type: huggingface",
            input: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027",
            expected: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "huggingface: Roundtrip test for PURL type: huggingface",
            input: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https://hub-ci.huggingface.co",
            expected: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https:%2F%2Fhub-ci.huggingface.co"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "julia: valid julia purl roundtrip test - basic package",
            input: "pkg:julia/Dates@1.9.0?uuid=ade2ca70-3891-5945-98fb-dc099432e06a",
            expected: "pkg:julia/Dates@1.9.0?uuid=ade2ca70-3891-5945-98fb-dc099432e06a"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "julia: valid julia purl roundtrip test - multiple qualifiers",
            input: "pkg:julia/RegisterQD@0.3.1?repository_url=https://github.com/HolyLab/HolyLabRegistry&uuid=ac24ea0c-1830-11e9-18d4-81f172323054",
            expected: "pkg:julia/RegisterQD@0.3.1?repository_url=https:%2F%2Fgithub.com%2FHolyLab%2FHolyLabRegistry&uuid=ac24ea0c-1830-11e9-18d4-81f172323054"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "luarocks: Roundtrip test for PURL type: luarocks", input: "pkg:luarocks/luasocket@3.1.0-1", expected: "pkg:luarocks/luasocket@3.1.0-1"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "luarocks: Roundtrip test for PURL type: luarocks",
            input: "pkg:luarocks/hisham/luafilesystem@1.8.0-1",
            expected: "pkg:luarocks/hisham/luafilesystem@1.8.0-1"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "luarocks: Roundtrip test for PURL type: luarocks",
            input: "pkg:luarocks/username/packagename@0.1.0-1?repository_url=https://example.com/private_rocks_server/",
            expected: "pkg:luarocks/username/packagename@0.1.0-1?repository_url=https:%2F%2Fexample.com%2Fprivate_rocks_server%2F"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: valid maven purl. Roundtrip an input purl to canonical.",
            input: "pkg:maven/org.apache.commons/io@1.3.4",
            expected: "pkg:maven/org.apache.commons/io@1.3.4"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: valid maven purl. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/org.apache.commons/io@1.3.4",
            expected: "pkg:maven/org.apache.commons/io@1.3.4"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: basic valid maven purl without version. Roundtrip an input purl to canonical.",
            input: "pkg:maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: basic valid maven purl without version. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: maven often uses qualifiers. Roundtrip an input purl to canonical using mixedcase type",
            input: "pkg:Maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources&repositorY_url=https://repo.spring.io/release",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources&repository_url=https:%2F%2Frepo.spring.io%2Frelease"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: maven often uses qualifiers. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources&repository_url=repo.spring.io/release",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources&repository_url=repo.spring.io%2Frelease"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: maven pom reference. Roundtrip an input purl to canonical.",
            input: "pkg:Maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=pom&repositorY_url=repo.spring.io/release",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?repository_url=repo.spring.io%2Frelease&type=pom"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: maven pom reference. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=war&repository_url=https://repo.spring.io/release",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?repository_url=https:%2F%2Frepo.spring.io%2Frelease&type=war"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: maven can come with a type qualifier. Roundtrip an input purl to canonical.",
            input: "pkg:Maven/net.sf.jacob-project/jacob@1.14.3?classifier=x86&type=dll",
            expected: "pkg:maven/net.sf.jacob-project/jacob@1.14.3?classifier=x86&type=dll"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: maven can come with a type qualifier. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/net.sf.jacob-project/jacob@1.14.3?classifier=x86&type=dll",
            expected: "pkg:maven/net.sf.jacob-project/jacob@1.14.3?classifier=x86&type=dll"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: slash / after type is not significant. Roundtrip an input purl to canonical.",
            input: "pkg:/maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: slash / after type is not significant. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: double slash // after type is not significant. Roundtrip an input purl to canonical.",
            input: "pkg://maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: double slash // after type is not significant. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: slash /// after type is not significant. Roundtrip an input purl to canonical.",
            input: "pkg:///maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: slash /// after type is not significant. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/org.apache.commons/io",
            expected: "pkg:maven/org.apache.commons/io"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: valid maven purl with case sensitive namespace and name. Roundtrip an input purl to canonical.",
            input: "pkg:maven/HTTPClient/HTTPClient@0.3-3",
            expected: "pkg:maven/HTTPClient/HTTPClient@0.3-3"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: valid maven purl with case sensitive namespace and name. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/HTTPClient/HTTPClient@0.3-3",
            expected: "pkg:maven/HTTPClient/HTTPClient@0.3-3"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: valid maven purl containing a space in the version and qualifier. Roundtrip an input purl to canonical.",
            input: "pkg:maven/mygroup/myartifact@1.0.0%20Final?mykey=my%20value",
            expected: "pkg:maven/mygroup/myartifact@1.0.0%20Final?mykey=my%20value"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: valid maven purl containing a space in the version and qualifier. Roundtrip a canonical input to canonical output.",
            input: "pkg:maven/mygroup/myartifact@1.0.0%20Final?mykey=my%20value",
            expected: "pkg:maven/mygroup/myartifact@1.0.0%20Final?mykey=my%20value"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: Roundtrip test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: Roundtrip test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=pom",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=pom"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: Roundtrip test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: Roundtrip test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=zip&classifier=dist",
            expected: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=dist&type=zip"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: Roundtrip test for PURL type: maven",
            input: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x86&type=dll",
            expected: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x86&type=dll"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: Roundtrip test for PURL type: maven",
            input: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x64&type=dll",
            expected: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x64&type=dll"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "maven: Roundtrip test for PURL type: maven",
            input: "pkg:maven/groovy/groovy@1.0?repository_url=https://maven.google.com",
            expected: "pkg:maven/groovy/groovy@1.0?repository_url=https:%2F%2Fmaven.google.com"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "mlflow: MLflow model tracked in Azure Databricks (case insensitive). Roundtrip a canonical input to canonical output.",
            input: "pkg:mlflow/creditfraud@3?repository_url=https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
            expected: "pkg:mlflow/creditfraud@3?repository_url=https:%2F%2Fadb-5245952564735461.0.azuredatabricks.net%2Fapi%2F2.0%2Fmlflow"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "mlflow: MLflow model tracked in Azure ML (case sensitive). Roundtrip an input purl to canonical.",
            input:
                "pkg:mlflow/CreditFraud@3?repository_url=https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace",
            expected:
                "pkg:mlflow/CreditFraud@3?repository_url=https:%2F%2Fwestus2.api.azureml.ms%2Fmlflow%2Fv1.0%2Fsubscriptions%2Fa50f2011-fab8-4164-af23-c62881ef8c95%2FresourceGroups%2FTestResourceGroup%2Fproviders%2FMicrosoft.MachineLearningServices%2Fworkspaces%2FTestWorkspace"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "mlflow: MLflow model tracked in Azure ML (case sensitive). Roundtrip a canonical input to canonical output.",
            input:
                "pkg:mlflow/CreditFraud@3?repository_url=https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace",
            expected:
                "pkg:mlflow/CreditFraud@3?repository_url=https:%2F%2Fwestus2.api.azureml.ms%2Fmlflow%2Fv1.0%2Fsubscriptions%2Fa50f2011-fab8-4164-af23-c62881ef8c95%2FresourceGroups%2FTestResourceGroup%2Fproviders%2FMicrosoft.MachineLearningServices%2Fworkspaces%2FTestWorkspace"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "mlflow: MLflow model with unique identifiers. Roundtrip an input purl to canonical.",
            input:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a&repository_url=https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
            expected:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&repository_url=https:%2F%2Fadb-5245952564735461.0.azuredatabricks.net%2Fapi%2F2.0%2Fmlflow&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "mlflow: MLflow model with unique identifiers. Roundtrip a canonical input to canonical output.",
            input:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&repository_url=https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a",
            expected:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&repository_url=https:%2F%2Fadb-5245952564735461.0.azuredatabricks.net%2Fapi%2F2.0%2Fmlflow&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "mlflow: Roundtrip test for PURL type: mlflow",
            input:
                "pkg:mlflow/creditfraud@3?repository_url=https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace",
            expected:
                "pkg:mlflow/creditfraud@3?repository_url=https:%2F%2Fwestus2.api.azureml.ms%2Fmlflow%2Fv1.0%2Fsubscriptions%2Fa50f2011-fab8-4164-af23-c62881ef8c95%2FresourceGroups%2FTestResourceGroup%2Fproviders%2FMicrosoft.MachineLearningServices%2Fworkspaces%2FTestWorkspace"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "mlflow: Roundtrip test for PURL type: mlflow",
            input:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a&repository_url=https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
            expected:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&repository_url=https:%2F%2Fadb-5245952564735461.0.azuredatabricks.net%2Fapi%2F2.0%2Fmlflow&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "npm: npm can be scoped. Roundtrip an input purl to canonical.",
            input: "pkg:npm/%40angular/animation@12.3.1",
            expected: "pkg:npm/%40angular/animation@12.3.1"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "npm: npm can be scoped. Roundtrip a canonical input to canonical output.",
            input: "pkg:npm/%40angular/animation@12.3.1",
            expected: "pkg:npm/%40angular/animation@12.3.1"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "npm: Roundtrip test for PURL type: npm", input: "pkg:npm/foobar@12.3.1", expected: "pkg:npm/foobar@12.3.1"),
        ECMA_427.PURL.Test.Roundtrip(description: "npm: Roundtrip test for PURL type: npm", input: "pkg:npm/%40angular/animation@12.3.1", expected: "pkg:npm/%40angular/animation@12.3.1"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "npm: Roundtrip test for PURL type: npm",
            input: "pkg:npm/mypackage@12.4.5?vcs_url=git://host.com/path/to/repo.git%404345abcd34343",
            expected: "pkg:npm/mypackage@12.4.5?vcs_url=git:%2F%2Fhost.com%2Fpath%2Fto%2Frepo.git%404345abcd34343"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "npm: valid npm purl without version and with subpath, scope unencoded",
            input: "pkg:npm/@babel/core#/googleapis/api/annotations/",
            expected: "pkg:npm/%40babel/core#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "npm: valid npm purl without namespace and with subpath",
            input: "pkg:npm/core@2.0.1#/googleapis/api/annotations/",
            expected: "pkg:npm/core@2.0.1#googleapis/api/annotations"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "nuget: nuget names are case sensitive. Roundtrip an input purl to canonical.",
            input: "pkg:Nuget/EnterpriseLibrary.Common@6.0.1304",
            expected: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "nuget: nuget names are case sensitive. Roundtrip a canonical input to canonical output.",
            input: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304",
            expected: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "nuget: Roundtrip test for PURL type: nuget",
            input: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304",
            expected: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "oci: Roundtrip test for PURL type: oci",
            input: "pkg:oci/debian@sha256%3A244fd47e07d10?repository_url=docker.io/library/debian&arch=amd64&tag=latest",
            expected: "pkg:oci/debian@sha256:244fd47e07d10?arch=amd64&repository_url=docker.io%2Flibrary%2Fdebian&tag=latest"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "oci: Roundtrip test for PURL type: oci",
            input: "pkg:oci/debian@sha256%3A244fd47e07d10?repository_url=ghcr.io/debian&tag=bullseye",
            expected: "pkg:oci/debian@sha256:244fd47e07d10?repository_url=ghcr.io%2Fdebian&tag=bullseye"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "oci: Roundtrip test for PURL type: oci",
            input: "pkg:oci/static@sha256%3A244fd47e07d10?repository_url=gcr.io/distroless/static&tag=latest",
            expected: "pkg:oci/static@sha256:244fd47e07d10?repository_url=gcr.io%2Fdistroless%2Fstatic&tag=latest"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "oci: Roundtrip test for PURL type: oci",
            input: "pkg:oci/hello-wasm@sha256%3A244fd47e07d10?tag=v1",
            expected: "pkg:oci/hello-wasm@sha256:244fd47e07d10?tag=v1"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "otp: Roundtrip test for <class 'type'> PURL",
            input: "pkg:otp/asn1@5.4.1?arch=amd64&platform=linux&repository_url=https://github.com/erlang/otp&vcs_url=git%2Bhttps://github.com/erlang/otp.git#src/asn1ct.erl",
            expected: "pkg:otp/asn1@5.4.1?arch=amd64&platform=linux&repository_url=https:%2F%2Fgithub.com%2Ferlang%2Fotp&vcs_url=git%2Bhttps:%2F%2Fgithub.com%2Ferlang%2Fotp.git#src/asn1ct.erl"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "otp: Roundtrip test for <class 'type'> PURL", input: "pkg:otp/hex@2.1.1", expected: "pkg:otp/hex@2.1.1"),
        ECMA_427.PURL.Test.Roundtrip(description: "pub: Roundtrip test for PURL type: pub", input: "pkg:pub/characters@1.2.0", expected: "pkg:pub/characters@1.2.0"),
        ECMA_427.PURL.Test.Roundtrip(description: "pub: Roundtrip test for PURL type: pub", input: "pkg:pub/flutter@0.0.0", expected: "pkg:pub/flutter@0.0.0"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "pypi: pypi names have special rules and not case sensitive. Roundtrip a canonical input to canonical output.",
            input: "pkg:pypi/django-package@1.11.1.dev1",
            expected: "pkg:pypi/django-package@1.11.1.dev1"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "pypi: Roundtrip test for PURL type: pypi", input: "pkg:pypi/django@1.11.1", expected: "pkg:pypi/django@1.11.1"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "pypi: Roundtrip test for PURL type: pypi",
            input: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1.tar.gz",
            expected: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1.tar.gz"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "pypi: Roundtrip test for PURL type: pypi",
            input: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1-py2.py3-none-any.whl",
            expected: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1-py2.py3-none-any.whl"
        ),
        ECMA_427.PURL.Test.Roundtrip(description: "pypi: Roundtrip test for PURL type: pypi", input: "pkg:pypi/django-allauth@12.23", expected: "pkg:pypi/django-allauth@12.23"),
        ECMA_427.PURL.Test.Roundtrip(
            description: "qpkg: Roundtrip test for PURL type: qpkg",
            input: "pkg:qpkg/blackberry/com.qnx.sdp@7.0.0.SGA201702151847",
            expected: "pkg:qpkg/blackberry/com.qnx.sdp@7.0.0.SGA201702151847"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "qpkg: Roundtrip test for PURL type: qpkg",
            input: "pkg:qpkg/blackberry/com.qnx.qnx710.foo.bar.qux@0.0.4.01449T202205040833L",
            expected: "pkg:qpkg/blackberry/com.qnx.qnx710.foo.bar.qux@0.0.4.01449T202205040833L"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "rpm: rpm often use qualifiers. Roundtrip an input purl to canonical.",
            input: "pkg:Rpm/fedora/curl@7.50.3-1.fc25?Arch=i386&Distro=fedora-25",
            expected: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "rpm: rpm often use qualifiers. Roundtrip a canonical input to canonical output.",
            input: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25",
            expected: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "rpm: Roundtrip test for PURL type: rpm",
            input: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25",
            expected: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "rpm: Roundtrip test for PURL type: rpm",
            input: "pkg:rpm/fedora/centerim@4.22.10-1.el6?arch=i686&epoch=1&distro=fedora-25",
            expected: "pkg:rpm/fedora/centerim@4.22.10-1.el6?arch=i686&distro=fedora-25&epoch=1"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "swid: Roundtrip test for PURL type: swid",
            input: "pkg:swid/Acme/example.com/Enterprise+Server@1.0.0?tag_id=75b8c285-fa7b-485b-b199-4745e3004d0d",
            expected: "pkg:swid/Acme/example.com/Enterprise%2BServer@1.0.0?tag_id=75b8c285-fa7b-485b-b199-4745e3004d0d"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "swid: Roundtrip test for PURL type: swid",
            input: "pkg:swid/Fedora@29?tag_id=org.fedoraproject.Fedora-29",
            expected: "pkg:swid/Fedora@29?tag_id=org.fedoraproject.Fedora-29"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "swid: Roundtrip test for PURL type: swid",
            input: "pkg:swid/Adobe+Systems+Incorporated/Adobe+InDesign@CC?tag_id=CreativeCloud-CS6-Win-GM-MUL",
            expected: "pkg:swid/Adobe%2BSystems%2BIncorporated/Adobe%2BInDesign@CC?tag_id=CreativeCloud-CS6-Win-GM-MUL"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "swift: valid swift purl. Roundtrip an input purl to canonical.",
            input: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3",
            expected: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "swift: valid swift purl. Roundtrip a canonical input to canonical output.",
            input: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3",
            expected: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "swift: Roundtrip test for PURL type: swift",
            input: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3",
            expected: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3"
        ),
        ECMA_427.PURL.Test.Roundtrip(
            description: "swift: Roundtrip test for PURL type: swift",
            input: "pkg:swift/github.com/RxSwiftCommunity/RxFlow@2.12.4",
            expected: "pkg:swift/github.com/RxSwiftCommunity/RxFlow@2.12.4"
        ),
    ]
}
