// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nami",
    products: [
        .library(
            name: "Nami",
            targets: ["Nami"]),
    ],
    dependencies: [
        // No Nami Dependencies
    ],
    targets: [
        // Nami is a binary XCFramework
	.binaryTarget(
            name: "Nami",
            url: "https://packages.namiml.com/NamiSDK/Apple/2.4.3/Nami.xcframework-2.4.3.zip",
            checksum: "1926f55d2e3a4aa92044ddd5f746d3d9561176f529e7a9a9f84b9bfd6cb5f520"
        )
    ]
)
