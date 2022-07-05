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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0-rc.02/Nami.xcframework-3.0.0-rc.02.zip",
            checksum: "e782aeb14b1213ab8a8d0318b7a0842df30450325b0f05768e0f08d266d50297"
        )
    ]
)
