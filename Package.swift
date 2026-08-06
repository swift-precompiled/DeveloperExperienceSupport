// swift-tools-version:5.10.0

import PackageDescription
import Foundation

let package = Package(
    name: "DeveloperExperienceSupport",
    platforms: [
        .iOS("16.0"),
        .macOS("13.0"),
        .tvOS("17.0"),
        .watchOS("10.0")
    ],
    products: [
        .library(
            name: "DeveloperExperienceSupport",
            targets: ["DeveloperExperienceSupport_PrecompiledProduct"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/Merge",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-precompiled/Swallow",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "DeveloperExperienceSupport_Aggregation",
            dependencies: ["DeveloperExperienceSupport"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "DeveloperExperienceSupport",
            url: "https://github.com/swift-precompiled/DeveloperExperienceSupport/releases/download/main-1e3a3d81eb71388c4064468bf01f59446696f046/DeveloperExperienceSupport-3c3316ff09ba99ad74c28fa4892f5c08208c0a8833d2fcac3b8f425d8b96ac5d.xcframework.zip",
            checksum: "3c3316ff09ba99ad74c28fa4892f5c08208c0a8833d2fcac3b8f425d8b96ac5d"
        ),
        .target(
            name: "DeveloperExperienceSupport_PrecompiledProduct",
            dependencies: [
                "DeveloperExperienceSupport_Aggregation",
                .product(
                    name: "Merge",
                    package: "Merge"
                ),
                .product(
                    name: "Swallow",
                    package: "Swallow"
                )
            ]
        )
    ]
)