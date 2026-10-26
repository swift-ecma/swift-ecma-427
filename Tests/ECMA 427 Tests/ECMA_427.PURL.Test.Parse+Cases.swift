// Transliterated from the purl-spec v1.0.0 test suite (package-url/purl-spec, tests/spec and tests/types), MIT.
// Cases whose expectation rests on a type definition rather than on ECMA-427 Clause 5 are left out.
import ECMA_427

extension ECMA_427.PURL.Test.Parse {
    static let cases: [ECMA_427.PURL.Test.Parse] = [
        ECMA_427.PURL.Test.Parse(description: "specification: a scheme is always required", input: "EnterpriseLibrary.Common@6.0.1304", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: a scheme is always required", input: "EnterpriseLibrary.Common@6.0.1304", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: a type is always required", input: "pkg:EnterpriseLibrary.Common@6.0.1304", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: a type is always required", input: "pkg:EnterpriseLibrary.Common@6.0.1304", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: check for invalid character in type", input: "pkg:n&g?inx/nginx@0.8.9", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: check for type that starts with number", input: "pkg:3nginx/nginx@0.8.9", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: check for colon in type", input: "pkg:nginx:a/nginx@0.8.9", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: checks for invalid qualifier keys", input: "pkg:npm/myartifact@1.0.0?in%20production=true", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: a name is required", input: "pkg:maven/@1.3.4", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "specification: invalid encoded colon : between scheme and type", input: "pkg%3Amaven/org.apache.commons/io", expected: nil),
        ECMA_427.PURL.Test.Parse(
            description: "alpm: Parse test for PURL type: alpm",
            input: "pkg:alpm/arch/pacman@6.0.1-1?arch=x86_64",
            expected: ECMA_427.PURL.Test.Components(type: "alpm", namespace: "arch", name: "pacman", version: "6.0.1-1", qualifiers: ["arch": "x86_64"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "alpm: Parse test for PURL type: alpm",
            input: "pkg:alpm/arch/python-pip@21.0-1?arch=any",
            expected: ECMA_427.PURL.Test.Components(type: "alpm", namespace: "arch", name: "python-pip", version: "21.0-1", qualifiers: ["arch": "any"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "alpm: Parse test for PURL type: alpm",
            input: "pkg:alpm/arch/containers-common@1:0.47.4-4?arch=x86_64",
            expected: ECMA_427.PURL.Test.Components(type: "alpm", namespace: "arch", name: "containers-common", version: "1:0.47.4-4", qualifiers: ["arch": "x86_64"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "apk: Parse test for PURL type: apk",
            input: "pkg:apk/alpine/curl@7.83.0-r0?arch=x86",
            expected: ECMA_427.PURL.Test.Components(type: "apk", namespace: "alpine", name: "curl", version: "7.83.0-r0", qualifiers: ["arch": "x86"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "apk: Parse test for PURL type: apk",
            input: "pkg:apk/alpine/apk@2.12.9-r3?arch=x86",
            expected: ECMA_427.PURL.Test.Components(type: "apk", namespace: "alpine", name: "apk", version: "2.12.9-r3", qualifiers: ["arch": "x86"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bazel: bazel module with default registry",
            input: "pkg:bazel/rules_java@7.8.0?repository_url=https://bcr.bazel.build/",
            expected: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_java", version: "7.8.0", qualifiers: ["repository_url": "https://bcr.bazel.build/"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bazel: bazel module with custom registry",
            input: "pkg:bazel/rules_java@7.8.0?repository_url=https://example.org/bazel-registry/",
            expected: ECMA_427.PURL.Test.Components(
                type: "bazel",
                namespace: nil,
                name: "rules_java",
                version: "7.8.0",
                qualifiers: ["repository_url": "https://example.org/bazel-registry/"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bazel: bazel module with relaxed semver version",
            input: "pkg:bazel/curl@8.8.0.bcr.1",
            expected: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "curl", version: "8.8.0.bcr.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bazel: bazel module names are actually all lowercased, but this is not enforced by the PURL type spec for reasons",
            input: "pkg:bazel/Curl@8.8.0.bcr.1",
            expected: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "Curl", version: "8.8.0.bcr.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bazel: bazel module with multi-segment package",
            input: "pkg:bazel/rules_java@8.5.0#java/runfiles",
            expected: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_java", version: "8.5.0", qualifiers: [:], subpath: "java/runfiles")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bazel: bazel module with target reference",
            input: "pkg:bazel/rules_java@8.5.0#java/runfiles:runfiles",
            expected: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_java", version: "8.5.0", qualifiers: [:], subpath: "java/runfiles:runfiles")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bazel: bazel module with single-segment package",
            input: "pkg:bazel/rules_go@0.48.0#go",
            expected: ECMA_427.PURL.Test.Components(type: "bazel", namespace: nil, name: "rules_go", version: "0.48.0", qualifiers: [:], subpath: "go")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bitbucket: Parse test for PURL type: bitbucket",
            input: "pkg:bitbucket/birkenfeld/pygments-main@244fd47e07d1014f0aed9c",
            expected: ECMA_427.PURL.Test.Components(type: "bitbucket", namespace: "birkenfeld", name: "pygments-main", version: "244fd47e07d1014f0aed9c", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bitnami: Parse test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress?distro=debian-12",
            expected: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: nil, qualifiers: ["distro": "debian-12"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bitnami: Parse test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress@6.2.0?distro=debian-12",
            expected: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: "6.2.0", qualifiers: ["distro": "debian-12"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bitnami: Parse test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=debian-12",
            expected: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: "6.2.0", qualifiers: ["arch": "arm64", "distro": "debian-12"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "bitnami: Parse test for PURL type: bitnami",
            input: "pkg:bitnami/wordpress@6.2.0?arch=arm64&distro=photon-4",
            expected: ECMA_427.PURL.Test.Components(type: "bitnami", namespace: nil, name: "wordpress", version: "6.2.0", qualifiers: ["arch": "arm64", "distro": "photon-4"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cargo: Parse test for PURL type: cargo",
            input: "pkg:cargo/rand@0.7.2",
            expected: ECMA_427.PURL.Test.Components(type: "cargo", namespace: nil, name: "rand", version: "0.7.2", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cargo: Parse test for PURL type: cargo",
            input: "pkg:cargo/clap@2.33.0",
            expected: ECMA_427.PURL.Test.Components(type: "cargo", namespace: nil, name: "clap", version: "2.33.0", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cargo: Parse test for PURL type: cargo",
            input: "pkg:cargo/structopt@0.3.11",
            expected: ECMA_427.PURL.Test.Components(type: "cargo", namespace: nil, name: "structopt", version: "0.3.11", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cocoapods: Parse test for PURL type: cocoapods",
            input: "pkg:cocoapods/AFNetworking@4.0.1",
            expected: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "AFNetworking", version: "4.0.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cocoapods: Parse test for PURL type: cocoapods",
            input: "pkg:cocoapods/MapsIndoors@3.24.0",
            expected: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "MapsIndoors", version: "3.24.0", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cocoapods: Parse test for PURL type: cocoapods",
            input: "pkg:cocoapods/ShareKit@2.0#Twitter",
            expected: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "ShareKit", version: "2.0", qualifiers: [:], subpath: "Twitter")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cocoapods: Parse test for PURL type: cocoapods",
            input: "pkg:cocoapods/GoogleUtilities@7.5.2#NSData+zlib",
            expected: ECMA_427.PURL.Test.Components(type: "cocoapods", namespace: nil, name: "GoogleUtilities", version: "7.5.2", qualifiers: [:], subpath: "NSData+zlib")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "composer: valid packagist purl",
            input: "pkg:composer/guzzlehttp/promises@2.0.2",
            expected: ECMA_427.PURL.Test.Components(type: "composer", namespace: "guzzlehttp", name: "promises", version: "2.0.2", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "composer: Parse test for PURL type: composer",
            input: "pkg:composer/laravel/laravel@5.5.0",
            expected: ECMA_427.PURL.Test.Components(type: "composer", namespace: "laravel", name: "laravel", version: "5.5.0", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "conan: valid conan purl",
            input: "pkg:conan/cctz@2.3",
            expected: ECMA_427.PURL.Test.Components(type: "conan", namespace: nil, name: "cctz", version: "2.3", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "conan: valid conan purl with namespace and qualifier channel",
            input: "pkg:conan/bincrafters/cctz@2.3?channel=stable",
            expected: ECMA_427.PURL.Test.Components(type: "conan", namespace: "bincrafters", name: "cctz", version: "2.3", qualifiers: ["channel": "stable"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "conan: Parse test for PURL type: conan",
            input: "pkg:conan/openssl@3.0.3",
            expected: ECMA_427.PURL.Test.Components(type: "conan", namespace: nil, name: "openssl", version: "3.0.3", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "conan: Parse test for PURL type: conan",
            input: "pkg:conan/openssl.org/openssl@3.0.3?user=bincrafters&channel=stable",
            expected: ECMA_427.PURL.Test.Components(type: "conan", namespace: "openssl.org", name: "openssl", version: "3.0.3", qualifiers: ["channel": "stable", "user": "bincrafters"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "conan: Parse test for PURL type: conan",
            input:
                "pkg:conan/openssl.org/openssl@3.0.3?arch=x86_64&build_type=Debug&compiler=Visual%20Studio&compiler.runtime=MDd&compiler.version=16&os=Windows&shared=True&rrev=93a82349c31917d2d674d22065c7a9ef9f380c8e&prev=b429db8a0e324114c25ec387bfd8281f330d7c5c",
            expected: ECMA_427.PURL.Test.Components(
                type: "conan",
                namespace: "openssl.org",
                name: "openssl",
                version: "3.0.3",
                qualifiers: [
                    "arch": "x86_64", "build_type": "Debug", "compiler": "Visual Studio", "compiler.runtime": "MDd", "compiler.version": "16", "os": "Windows",
                    "prev": "b429db8a0e324114c25ec387bfd8281f330d7c5c", "rrev": "93a82349c31917d2d674d22065c7a9ef9f380c8e", "shared": "True",
                ],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "conda: valid conda purl with qualifiers",
            input: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2",
            expected: ECMA_427.PURL.Test.Components(
                type: "conda",
                namespace: nil,
                name: "absl-py",
                version: "0.4.1",
                qualifiers: ["build": "py36h06a4308_0", "channel": "main", "subdir": "linux-64", "type": "tar.bz2"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "conda: Parse test for PURL type: conda",
            input: "pkg:conda/absl-py@0.4.1?build=py36h06a4308_0&channel=main&subdir=linux-64&type=tar.bz2",
            expected: ECMA_427.PURL.Test.Components(
                type: "conda",
                namespace: nil,
                name: "absl-py",
                version: "0.4.1",
                qualifiers: ["build": "py36h06a4308_0", "channel": "main", "subdir": "linux-64", "type": "tar.bz2"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cpan: CPAN distribution name are case sensitive",
            input: "pkg:cpan/DROLSKY/DateTime@1.55",
            expected: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "DROLSKY", name: "DateTime", version: "1.55", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cpan: Parse test for PURL type: cpan",
            input: "pkg:cpan/GDT/URI-PackageURL",
            expected: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "GDT", name: "URI-PackageURL", version: nil, qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cpan: Parse test for PURL type: cpan",
            input: "pkg:cpan/OALDERS/libwww-perl@6.76",
            expected: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "OALDERS", name: "libwww-perl", version: "6.76", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cpan: Parse test for PURL type: cpan",
            input: "pkg:cpan/DROLSKY/DateTime@1.55?repository_url=backpan.perl.org",
            expected: ECMA_427.PURL.Test.Components(type: "cpan", namespace: "DROLSKY", name: "DateTime", version: "1.55", qualifiers: ["repository_url": "backpan.perl.org"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cran: valid cran purl",
            input: "pkg:cran/A3@0.9.1",
            expected: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "A3", version: "0.9.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(description: "cran: invalid cran purl without name", input: "pkg:cran/@0.9.1", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "cran: invalid cran purl without name", input: "pkg:cran/@0.9.1", expected: nil),
        ECMA_427.PURL.Test.Parse(
            description: "cran: Parse test for PURL type: cran",
            input: "pkg:cran/A3@1.0.0",
            expected: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "A3", version: "1.0.0", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cran: Parse test for PURL type: cran",
            input: "pkg:cran/rJava@1.0-4",
            expected: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "rJava", version: "1.0-4", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "cran: Parse test for PURL type: cran",
            input: "pkg:cran/caret@6.0-88",
            expected: ECMA_427.PURL.Test.Components(type: "cran", namespace: nil, name: "caret", version: "6.0-88", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "deb: debian can use qualifiers",
            input: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie",
            expected: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "curl", version: "7.50.3-1", qualifiers: ["arch": "i386", "distro": "jessie"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "deb: Parse test for PURL type: deb",
            input: "pkg:deb/debian/curl@7.50.3-1?arch=i386&distro=jessie",
            expected: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "curl", version: "7.50.3-1", qualifiers: ["arch": "i386", "distro": "jessie"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "deb: Parse test for PURL type: deb",
            input: "pkg:deb/debian/dpkg@1.19.0.4?arch=amd64&distro=stretch",
            expected: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "dpkg", version: "1.19.0.4", qualifiers: ["arch": "amd64", "distro": "stretch"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "deb: Parse test for PURL type: deb",
            input: "pkg:deb/ubuntu/dpkg@1.19.0.4?arch=amd64",
            expected: ECMA_427.PURL.Test.Components(type: "deb", namespace: "ubuntu", name: "dpkg", version: "1.19.0.4", qualifiers: ["arch": "amd64"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "deb: Parse test for PURL type: deb",
            input: "pkg:deb/debian/attr@1:2.4.47-2?arch=source",
            expected: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "attr", version: "1:2.4.47-2", qualifiers: ["arch": "source"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "deb: Parse test for PURL type: deb",
            input: "pkg:deb/debian/attr@1:2.4.47-2%2Bb1?arch=amd64",
            expected: ECMA_427.PURL.Test.Components(type: "deb", namespace: "debian", name: "attr", version: "1:2.4.47-2+b1", qualifiers: ["arch": "amd64"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "docker: docker uses qualifiers and hash image id as versions",
            input: "pkg:docker/customer/dockerimage@sha256:244fd47e07d1004f0aed9c?repository_url=gcr.io",
            expected: ECMA_427.PURL.Test.Components(
                type: "docker",
                namespace: "customer",
                name: "dockerimage",
                version: "sha256:244fd47e07d1004f0aed9c",
                qualifiers: ["repository_url": "gcr.io"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "docker: Parse test for PURL type: docker",
            input: "pkg:docker/cassandra@latest",
            expected: ECMA_427.PURL.Test.Components(type: "docker", namespace: nil, name: "cassandra", version: "latest", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "docker: Parse test for PURL type: docker",
            input: "pkg:docker/smartentry/debian@dc437cc87d10",
            expected: ECMA_427.PURL.Test.Components(type: "docker", namespace: "smartentry", name: "debian", version: "dc437cc87d10", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "docker: Parse test for PURL type: docker",
            input: "pkg:docker/customer/dockerimage@sha256:244fd47e07d10?repository_url=gcr.io",
            expected: ECMA_427.PURL.Test.Components(type: "docker", namespace: "customer", name: "dockerimage", version: "sha256:244fd47e07d10", qualifiers: ["repository_url": "gcr.io"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "gem: Ruby gems can use qualifiers",
            input: "pkg:gem/jruby-launcher@1.1.2?Platform=java",
            expected: ECMA_427.PURL.Test.Components(type: "gem", namespace: nil, name: "jruby-launcher", version: "1.1.2", qualifiers: ["platform": "java"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "gem: Parse test for PURL type: gem",
            input: "pkg:gem/ruby-advisory-db-check@0.12.4",
            expected: ECMA_427.PURL.Test.Components(type: "gem", namespace: nil, name: "ruby-advisory-db-check", version: "0.12.4", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "gem: Parse test for PURL type: gem",
            input: "pkg:gem/jruby-launcher@1.1.2?platform=java",
            expected: ECMA_427.PURL.Test.Components(type: "gem", namespace: nil, name: "jruby-launcher", version: "1.1.2", qualifiers: ["platform": "java"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "generic: Parse test for PURL type: generic",
            input: "pkg:generic/openssl@1.1.10g",
            expected: ECMA_427.PURL.Test.Components(type: "generic", namespace: nil, name: "openssl", version: "1.1.10g", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "generic: Parse test for PURL type: generic",
            input: "pkg:generic/openssl@1.1.10g?download_url=https://openssl.org/source/openssl-1.1.0g.tar.gz&checksum=sha256:de4d501267da",
            expected: ECMA_427.PURL.Test.Components(
                type: "generic",
                namespace: nil,
                name: "openssl",
                version: "1.1.10g",
                qualifiers: ["checksum": "sha256:de4d501267da", "download_url": "https://openssl.org/source/openssl-1.1.0g.tar.gz"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "generic: Parse test for PURL type: generic",
            input: "pkg:generic/bitwarderl?vcs_url=git%2Bhttps://git.fsfe.org/dxtr/bitwarderl%40cc55108da32",
            expected: ECMA_427.PURL.Test.Components(
                type: "generic",
                namespace: nil,
                name: "bitwarderl",
                version: nil,
                qualifiers: ["vcs_url": "git+https://git.fsfe.org/dxtr/bitwarderl@cc55108da32"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "github: Parse test for PURL type: github",
            input: "pkg:github/package-url/purl-spec@244fd47e07d1004",
            expected: ECMA_427.PURL.Test.Components(type: "github", namespace: "package-url", name: "purl-spec", version: "244fd47e07d1004", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "github: Parse test for PURL type: github",
            input: "pkg:github/package-url/purl-spec@244fd47e07d1004#everybody/loves/dogs",
            expected: ECMA_427.PURL.Test.Components(type: "github", namespace: "package-url", name: "purl-spec", version: "244fd47e07d1004", qualifiers: [:], subpath: "everybody/loves/dogs")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "golang: valid go purl without version and with subpath",
            input: "pkg:GOLANG/google.golang.org/genproto#/googleapis/api/annotations/",
            expected: ECMA_427.PURL.Test.Components(type: "golang", namespace: "google.golang.org", name: "genproto", version: nil, qualifiers: [:], subpath: "googleapis/api/annotations")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "golang: valid go purl with version and subpath",
            input: "pkg:GOLANG/google.golang.org/genproto@abcdedf#/googleapis/api/annotations/",
            expected: ECMA_427.PURL.Test.Components(type: "golang", namespace: "google.golang.org", name: "genproto", version: "abcdedf", qualifiers: [:], subpath: "googleapis/api/annotations")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "golang: Parse test for PURL type: golang",
            input: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c",
            expected: ECMA_427.PURL.Test.Components(type: "golang", namespace: "github.com/gorilla", name: "context", version: "234fd47e07d1004f0aed9c", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "golang: Parse test for PURL type: golang",
            input: "pkg:golang/google.golang.org/genproto#googleapis/api/annotations",
            expected: ECMA_427.PURL.Test.Components(type: "golang", namespace: "google.golang.org", name: "genproto", version: nil, qualifiers: [:], subpath: "googleapis/api/annotations")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "golang: Parse test for PURL type: golang",
            input: "pkg:golang/github.com/gorilla/context@234fd47e07d1004f0aed9c#api",
            expected: ECMA_427.PURL.Test.Components(type: "golang", namespace: "github.com/gorilla", name: "context", version: "234fd47e07d1004f0aed9c", qualifiers: [:], subpath: "api")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "hackage: valid hackage purl",
            input: "pkg:hackage/AC-HalfInteger@1.2.1",
            expected: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "AC-HalfInteger", version: "1.2.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(description: "hackage: name and version are always required", input: "pkg:hackage", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "hackage: name and version are always required", input: "pkg:hackage", expected: nil),
        ECMA_427.PURL.Test.Parse(
            description: "hackage: Parse test for PURL type: hackage",
            input: "pkg:hackage/a50@0.5",
            expected: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "a50", version: "0.5", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "hackage: Parse test for PURL type: hackage",
            input: "pkg:hackage/AC-HalfInteger@1.2.1",
            expected: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "AC-HalfInteger", version: "1.2.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "hackage: Parse test for PURL type: hackage",
            input: "pkg:hackage/3d-graphics-examples@0.0.0.2",
            expected: ECMA_427.PURL.Test.Components(type: "hackage", namespace: nil, name: "3d-graphics-examples", version: "0.0.0.2", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "hex: Parse test for PURL type: hex",
            input: "pkg:hex/jason@1.1.2",
            expected: ECMA_427.PURL.Test.Components(type: "hex", namespace: nil, name: "jason", version: "1.1.2", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "hex: Parse test for PURL type: hex",
            input: "pkg:hex/acme/foo@2.3.",
            expected: ECMA_427.PURL.Test.Components(type: "hex", namespace: "acme", name: "foo", version: "2.3.", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "hex: Parse test for PURL type: hex",
            input: "pkg:hex/phoenix_html@2.13.3#priv/static/phoenix_html.js",
            expected: ECMA_427.PURL.Test.Components(type: "hex", namespace: nil, name: "phoenix_html", version: "2.13.3", qualifiers: [:], subpath: "priv/static/phoenix_html.js")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "hex: Parse test for PURL type: hex",
            input: "pkg:hex/bar@1.2.3?repository_url=https://myrepo.example.com",
            expected: ECMA_427.PURL.Test.Components(type: "hex", namespace: nil, name: "bar", version: "1.2.3", qualifiers: ["repository_url": "https://myrepo.example.com"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "huggingface: minimal Hugging Face model",
            input: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027",
            expected: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: nil,
                name: "distilbert-base-uncased",
                version: "043235d6088ecd3dd5fb5ca3592b6913fd516027",
                qualifiers: [:],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "huggingface: Hugging Face model with staging endpoint",
            input: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https://hub-ci.huggingface.co",
            expected: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: "microsoft",
                name: "deberta-v3-base",
                version: "559062ad13d311b87b2c455e67dcd5f1c8f65111",
                qualifiers: ["repository_url": "https://hub-ci.huggingface.co"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "huggingface: Parse test for PURL type: huggingface",
            input: "pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd516027",
            expected: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: nil,
                name: "distilbert-base-uncased",
                version: "043235d6088ecd3dd5fb5ca3592b6913fd516027",
                qualifiers: [:],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "huggingface: Parse test for PURL type: huggingface",
            input: "pkg:huggingface/microsoft/deberta-v3-base@559062ad13d311b87b2c455e67dcd5f1c8f65111?repository_url=https://hub-ci.huggingface.co",
            expected: ECMA_427.PURL.Test.Components(
                type: "huggingface",
                namespace: "microsoft",
                name: "deberta-v3-base",
                version: "559062ad13d311b87b2c455e67dcd5f1c8f65111",
                qualifiers: ["repository_url": "https://hub-ci.huggingface.co"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "julia: valid julia purl for stdlib package with version and uuid",
            input: "pkg:julia/Dates@1.9.0?uuid=ade2ca70-3891-5945-98fb-dc099432e06a",
            expected: ECMA_427.PURL.Test.Components(type: "julia", namespace: nil, name: "Dates", version: "1.9.0", qualifiers: ["uuid": "ade2ca70-3891-5945-98fb-dc099432e06a"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "julia: valid julia purl for stdlib package with uuid but no version",
            input: "pkg:julia/Dates?uuid=ade2ca70-3891-5945-98fb-dc099432e06a",
            expected: ECMA_427.PURL.Test.Components(type: "julia", namespace: nil, name: "Dates", version: nil, qualifiers: ["uuid": "ade2ca70-3891-5945-98fb-dc099432e06a"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "julia: valid julia purl, version and uuid",
            input: "pkg:julia/AWS@1.88.0?uuid=fbe9abb3-538b-5e4e-ba9e-bc94f4f92ebc",
            expected: ECMA_427.PURL.Test.Components(type: "julia", namespace: nil, name: "AWS", version: "1.88.0", qualifiers: ["uuid": "fbe9abb3-538b-5e4e-ba9e-bc94f4f92ebc"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "julia: valid julia purl with both uuid and repository_url qualifiers",
            input: "pkg:julia/RegisterQD@0.3.1?repository_url=https://github.com/HolyLab/HolyLabRegistry&uuid=ac24ea0c-1830-11e9-18d4-81f172323054",
            expected: ECMA_427.PURL.Test.Components(
                type: "julia",
                namespace: nil,
                name: "RegisterQD",
                version: "0.3.1",
                qualifiers: ["repository_url": "https://github.com/HolyLab/HolyLabRegistry", "uuid": "ac24ea0c-1830-11e9-18d4-81f172323054"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(description: "julia: invalid julia purl without name", input: "pkg:julia/@1.9.0", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "julia: invalid julia purl with only type", input: "pkg:julia", expected: nil),
        ECMA_427.PURL.Test.Parse(
            description: "luarocks: Parse test for PURL type: luarocks",
            input: "pkg:luarocks/luasocket@3.1.0-1",
            expected: ECMA_427.PURL.Test.Components(type: "luarocks", namespace: nil, name: "luasocket", version: "3.1.0-1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "luarocks: Parse test for PURL type: luarocks",
            input: "pkg:luarocks/hisham/luafilesystem@1.8.0-1",
            expected: ECMA_427.PURL.Test.Components(type: "luarocks", namespace: "hisham", name: "luafilesystem", version: "1.8.0-1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "luarocks: Parse test for PURL type: luarocks",
            input: "pkg:luarocks/username/packagename@0.1.0-1?repository_url=https://example.com/private_rocks_server/",
            expected: ECMA_427.PURL.Test.Components(
                type: "luarocks",
                namespace: "username",
                name: "packagename",
                version: "0.1.0-1",
                qualifiers: ["repository_url": "https://example.com/private_rocks_server/"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: valid maven purl",
            input: "pkg:maven/org.apache.commons/io@1.3.4",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: "1.3.4", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: basic valid maven purl without version",
            input: "pkg:maven/org.apache.commons/io",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: maven often uses qualifiers here mixedcase type",
            input: "pkg:Maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources&repositorY_url=https://repo.spring.io/release",
            expected: ECMA_427.PURL.Test.Components(
                type: "maven",
                namespace: "org.apache.xmlgraphics",
                name: "batik-anim",
                version: "1.9.1",
                qualifiers: ["classifier": "sources", "repository_url": "https://repo.spring.io/release"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: maven pom reference",
            input: "pkg:Maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=pom&repositorY_url=repo.spring.io/release",
            expected: ECMA_427.PURL.Test.Components(
                type: "maven",
                namespace: "org.apache.xmlgraphics",
                name: "batik-anim",
                version: "1.9.1",
                qualifiers: ["type": "pom", "repository_url": "repo.spring.io/release"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: maven can come with a type qualifier",
            input: "pkg:Maven/net.sf.jacob-project/jacob@1.14.3?classifier=x86&type=dll",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "net.sf.jacob-project", name: "jacob", version: "1.14.3", qualifiers: ["classifier": "x86", "type": "dll"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: slash / after type is not significant",
            input: "pkg:/maven/org.apache.commons/io",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: double slash // after type is not significant",
            input: "pkg://maven/org.apache.commons/io",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: slash /// after type is not significant",
            input: "pkg:///maven/org.apache.commons/io",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.commons", name: "io", version: nil, qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: valid maven purl with case sensitive namespace and name",
            input: "pkg:maven/HTTPClient/HTTPClient@0.3-3",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "HTTPClient", name: "HTTPClient", version: "0.3-3", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: valid maven purl containing a space in the version and qualifier",
            input: "pkg:maven/mygroup/myartifact@1.0.0%20Final?mykey=my%20value",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "mygroup", name: "myartifact", version: "1.0.0 Final", qualifiers: ["mykey": "my value"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: Parse test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.xmlgraphics", name: "batik-anim", version: "1.9.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: Parse test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=pom",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.xmlgraphics", name: "batik-anim", version: "1.9.1", qualifiers: ["type": "pom"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: Parse test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?classifier=sources",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "org.apache.xmlgraphics", name: "batik-anim", version: "1.9.1", qualifiers: ["classifier": "sources"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: Parse test for PURL type: maven",
            input: "pkg:maven/org.apache.xmlgraphics/batik-anim@1.9.1?type=zip&classifier=dist",
            expected: ECMA_427.PURL.Test.Components(
                type: "maven",
                namespace: "org.apache.xmlgraphics",
                name: "batik-anim",
                version: "1.9.1",
                qualifiers: ["classifier": "dist", "type": "zip"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: Parse test for PURL type: maven",
            input: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x86&type=dll",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "net.sf.jacob-projec", name: "jacob", version: "1.14.3", qualifiers: ["classifier": "x86", "type": "dll"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: Parse test for PURL type: maven",
            input: "pkg:maven/net.sf.jacob-projec/jacob@1.14.3?classifier=x64&type=dll",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "net.sf.jacob-projec", name: "jacob", version: "1.14.3", qualifiers: ["classifier": "x64", "type": "dll"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "maven: Parse test for PURL type: maven",
            input: "pkg:maven/groovy/groovy@1.0?repository_url=https://maven.google.com",
            expected: ECMA_427.PURL.Test.Components(type: "maven", namespace: "groovy", name: "groovy", version: "1.0", qualifiers: ["repository_url": "https://maven.google.com"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "mlflow: MLflow model tracked in Azure ML (case sensitive)",
            input:
                "pkg:mlflow/CreditFraud@3?repository_url=https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace",
            expected: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "CreditFraud",
                version: "3",
                qualifiers: [
                    "repository_url":
                        "https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace"
                ],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "mlflow: MLflow model with unique identifiers",
            input:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a&repository_url=https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
            expected: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "trafficsigns",
                version: "10",
                qualifiers: [
                    "model_uuid": "36233173b22f4c89b451f1228d700d49", "run_id": "410a3121-2709-4f88-98dd-dba0ef056b0a",
                    "repository_url": "https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
                ],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "mlflow: Parse test for PURL type: mlflow",
            input:
                "pkg:mlflow/creditfraud@3?repository_url=https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace",
            expected: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "creditfraud",
                version: "3",
                qualifiers: [
                    "repository_url":
                        "https://westus2.api.azureml.ms/mlflow/v1.0/subscriptions/a50f2011-fab8-4164-af23-c62881ef8c95/resourceGroups/TestResourceGroup/providers/Microsoft.MachineLearningServices/workspaces/TestWorkspace"
                ],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "mlflow: Parse test for PURL type: mlflow",
            input:
                "pkg:mlflow/trafficsigns@10?model_uuid=36233173b22f4c89b451f1228d700d49&run_id=410a3121-2709-4f88-98dd-dba0ef056b0a&repository_url=https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
            expected: ECMA_427.PURL.Test.Components(
                type: "mlflow",
                namespace: nil,
                name: "trafficsigns",
                version: "10",
                qualifiers: [
                    "model_uuid": "36233173b22f4c89b451f1228d700d49", "repository_url": "https://adb-5245952564735461.0.azuredatabricks.net/api/2.0/mlflow",
                    "run_id": "410a3121-2709-4f88-98dd-dba0ef056b0a",
                ],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "npm: npm can be scoped",
            input: "pkg:npm/%40angular/animation@12.3.1",
            expected: ECMA_427.PURL.Test.Components(type: "npm", namespace: "@angular", name: "animation", version: "12.3.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "npm: Parse test for PURL type: npm",
            input: "pkg:npm/foobar@12.3.1",
            expected: ECMA_427.PURL.Test.Components(type: "npm", namespace: nil, name: "foobar", version: "12.3.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "npm: Parse test for PURL type: npm",
            input: "pkg:npm/%40angular/animation@12.3.1",
            expected: ECMA_427.PURL.Test.Components(type: "npm", namespace: "@angular", name: "animation", version: "12.3.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "npm: Parse test for PURL type: npm",
            input: "pkg:npm/mypackage@12.4.5?vcs_url=git://host.com/path/to/repo.git%404345abcd34343",
            expected: ECMA_427.PURL.Test.Components(
                type: "npm",
                namespace: nil,
                name: "mypackage",
                version: "12.4.5",
                qualifiers: ["vcs_url": "git://host.com/path/to/repo.git@4345abcd34343"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "npm: valid npm purl without version and with subpath, scope unencoded",
            input: "pkg:npm/@babel/core#/googleapis/api/annotations/",
            expected: ECMA_427.PURL.Test.Components(type: "npm", namespace: "@babel", name: "core", version: nil, qualifiers: [:], subpath: "googleapis/api/annotations")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "npm: valid npm purl without version and with subpath, scope unencoded",
            input: "pkg:npm/%40babel/core#/googleapis/api/annotations/",
            expected: ECMA_427.PURL.Test.Components(type: "npm", namespace: "@babel", name: "core", version: nil, qualifiers: [:], subpath: "googleapis/api/annotations")
        ),
        ECMA_427.PURL.Test.Parse(
            description: "nuget: nuget names are case sensitive",
            input: "pkg:Nuget/EnterpriseLibrary.Common@6.0.1304",
            expected: ECMA_427.PURL.Test.Components(type: "nuget", namespace: nil, name: "EnterpriseLibrary.Common", version: "6.0.1304", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "nuget: Parse test for PURL type: nuget",
            input: "pkg:nuget/EnterpriseLibrary.Common@6.0.1304",
            expected: ECMA_427.PURL.Test.Components(type: "nuget", namespace: nil, name: "EnterpriseLibrary.Common", version: "6.0.1304", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "oci: Parse test for PURL type: oci",
            input: "pkg:oci/debian@sha256%3A244fd47e07d10?repository_url=docker.io/library/debian&arch=amd64&tag=latest",
            expected: ECMA_427.PURL.Test.Components(
                type: "oci",
                namespace: nil,
                name: "debian",
                version: "sha256:244fd47e07d10",
                qualifiers: ["arch": "amd64", "repository_url": "docker.io/library/debian", "tag": "latest"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "oci: Parse test for PURL type: oci",
            input: "pkg:oci/debian@sha256%3A244fd47e07d10?repository_url=ghcr.io/debian&tag=bullseye",
            expected: ECMA_427.PURL.Test.Components(
                type: "oci",
                namespace: nil,
                name: "debian",
                version: "sha256:244fd47e07d10",
                qualifiers: ["repository_url": "ghcr.io/debian", "tag": "bullseye"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "oci: Parse test for PURL type: oci",
            input: "pkg:oci/static@sha256%3A244fd47e07d10?repository_url=gcr.io/distroless/static&tag=latest",
            expected: ECMA_427.PURL.Test.Components(
                type: "oci",
                namespace: nil,
                name: "static",
                version: "sha256:244fd47e07d10",
                qualifiers: ["repository_url": "gcr.io/distroless/static", "tag": "latest"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "oci: Parse test for PURL type: oci",
            input: "pkg:oci/hello-wasm@sha256%3A244fd47e07d10?tag=v1",
            expected: ECMA_427.PURL.Test.Components(type: "oci", namespace: nil, name: "hello-wasm", version: "sha256:244fd47e07d10", qualifiers: ["tag": "v1"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "otp: Parse test for <class 'type'> PURL",
            input: "pkg:otp/asn1@5.4.1?arch=amd64&platform=linux&repository_url=https:%2F%2Fgithub.com%2Ferlang%2Fotp&vcs_url=git%2Bhttps:%2F%2Fgithub.com%2Ferlang%2Fotp.git#src/asn1ct.erl",
            expected: ECMA_427.PURL.Test.Components(
                type: "otp",
                namespace: nil,
                name: "asn1",
                version: "5.4.1",
                qualifiers: ["platform": "linux", "arch": "amd64", "repository_url": "https://github.com/erlang/otp", "vcs_url": "git+https://github.com/erlang/otp.git"],
                subpath: "src/asn1ct.erl"
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "otp: Parse test for <class 'type'> PURL",
            input: "pkg:otp/hex@2.1.1",
            expected: ECMA_427.PURL.Test.Components(type: "otp", namespace: nil, name: "hex", version: "2.1.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "pub: Parse test for PURL type: pub",
            input: "pkg:pub/characters@1.2.0",
            expected: ECMA_427.PURL.Test.Components(type: "pub", namespace: nil, name: "characters", version: "1.2.0", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "pub: Parse test for PURL type: pub",
            input: "pkg:pub/flutter@0.0.0",
            expected: ECMA_427.PURL.Test.Components(type: "pub", namespace: nil, name: "flutter", version: "0.0.0", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "pypi: Parse test for PURL type: pypi",
            input: "pkg:pypi/django@1.11.1",
            expected: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django", version: "1.11.1", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "pypi: Parse test for PURL type: pypi",
            input: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1.tar.gz",
            expected: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django", version: "1.11.1", qualifiers: ["file_name": "Django-1.11.1.tar.gz"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "pypi: Parse test for PURL type: pypi",
            input: "pkg:pypi/django@1.11.1?file_name=Django-1.11.1-py2.py3-none-any.whl",
            expected: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django", version: "1.11.1", qualifiers: ["file_name": "Django-1.11.1-py2.py3-none-any.whl"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "pypi: Parse test for PURL type: pypi",
            input: "pkg:pypi/django-allauth@12.23",
            expected: ECMA_427.PURL.Test.Components(type: "pypi", namespace: nil, name: "django-allauth", version: "12.23", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "qpkg: Parse test for PURL type: qpkg",
            input: "pkg:qpkg/blackberry/com.qnx.sdp@7.0.0.SGA201702151847",
            expected: ECMA_427.PURL.Test.Components(type: "qpkg", namespace: "blackberry", name: "com.qnx.sdp", version: "7.0.0.SGA201702151847", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "qpkg: Parse test for PURL type: qpkg",
            input: "pkg:qpkg/blackberry/com.qnx.qnx710.foo.bar.qux@0.0.4.01449T202205040833L",
            expected: ECMA_427.PURL.Test.Components(type: "qpkg", namespace: "blackberry", name: "com.qnx.qnx710.foo.bar.qux", version: "0.0.4.01449T202205040833L", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "rpm: rpm often use qualifiers",
            input: "pkg:Rpm/fedora/curl@7.50.3-1.fc25?Arch=i386&Distro=fedora-25",
            expected: ECMA_427.PURL.Test.Components(type: "rpm", namespace: "fedora", name: "curl", version: "7.50.3-1.fc25", qualifiers: ["arch": "i386", "distro": "fedora-25"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "rpm: Parse test for PURL type: rpm",
            input: "pkg:rpm/fedora/curl@7.50.3-1.fc25?arch=i386&distro=fedora-25",
            expected: ECMA_427.PURL.Test.Components(type: "rpm", namespace: "fedora", name: "curl", version: "7.50.3-1.fc25", qualifiers: ["arch": "i386", "distro": "fedora-25"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "rpm: Parse test for PURL type: rpm",
            input: "pkg:rpm/fedora/centerim@4.22.10-1.el6?arch=i686&epoch=1&distro=fedora-25",
            expected: ECMA_427.PURL.Test.Components(
                type: "rpm",
                namespace: "fedora",
                name: "centerim",
                version: "4.22.10-1.el6",
                qualifiers: ["arch": "i686", "distro": "fedora-25", "epoch": "1"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "swid: Parse test for PURL type: swid",
            input: "pkg:swid/Acme/example.com/Enterprise+Server@1.0.0?tag_id=75b8c285-fa7b-485b-b199-4745e3004d0d",
            expected: ECMA_427.PURL.Test.Components(
                type: "swid",
                namespace: "Acme/example.com",
                name: "Enterprise+Server",
                version: "1.0.0",
                qualifiers: ["tag_id": "75b8c285-fa7b-485b-b199-4745e3004d0d"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "swid: Parse test for PURL type: swid",
            input: "pkg:swid/Fedora@29?tag_id=org.fedoraproject.Fedora-29",
            expected: ECMA_427.PURL.Test.Components(type: "swid", namespace: nil, name: "Fedora", version: "29", qualifiers: ["tag_id": "org.fedoraproject.Fedora-29"], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "swid: Parse test for PURL type: swid",
            input: "pkg:swid/Adobe+Systems+Incorporated/Adobe+InDesign@CC?tag_id=CreativeCloud-CS6-Win-GM-MUL",
            expected: ECMA_427.PURL.Test.Components(
                type: "swid",
                namespace: "Adobe+Systems+Incorporated",
                name: "Adobe+InDesign",
                version: "CC",
                qualifiers: ["tag_id": "CreativeCloud-CS6-Win-GM-MUL"],
                subpath: nil
            )
        ),
        ECMA_427.PURL.Test.Parse(
            description: "swift: valid swift purl",
            input: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3",
            expected: ECMA_427.PURL.Test.Components(type: "swift", namespace: "github.com/Alamofire", name: "Alamofire", version: "5.4.3", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(description: "swift: invalid swift purl without name", input: "pkg:swift/github.com/Alamofire/@5.4.3", expected: nil),
        ECMA_427.PURL.Test.Parse(description: "swift: invalid swift purl without name", input: "pkg:swift/github.com/Alamofire/@5.4.3", expected: nil),
        ECMA_427.PURL.Test.Parse(
            description: "swift: Parse test for PURL type: swift",
            input: "pkg:swift/github.com/Alamofire/Alamofire@5.4.3",
            expected: ECMA_427.PURL.Test.Components(type: "swift", namespace: "github.com/Alamofire", name: "Alamofire", version: "5.4.3", qualifiers: [:], subpath: nil)
        ),
        ECMA_427.PURL.Test.Parse(
            description: "swift: Parse test for PURL type: swift",
            input: "pkg:swift/github.com/RxSwiftCommunity/RxFlow@2.12.4",
            expected: ECMA_427.PURL.Test.Components(type: "swift", namespace: "github.com/RxSwiftCommunity", name: "RxFlow", version: "2.12.4", qualifiers: [:], subpath: nil)
        ),
    ]
}
