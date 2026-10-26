// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-ecma-427",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "ECMA 427", targets: ["ECMA 427"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-ietf/swift-rfc-3986.git", branch: "main")
    ],
    targets: [
        .target(
            name: "ECMA 427",
            dependencies: [
                .product(name: "RFC 3986", package: "swift-rfc-3986")
            ]
        ),
        .testTarget(
            name: "ECMA 427 Tests",
            dependencies: [
                .target(name: "ECMA 427")
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableUpcomingFeature("InferIsolatedConformances"),
            .enableExperimentalFeature("Lifetimes"),
            .treatAllWarnings(as: .error),
        ]
}
