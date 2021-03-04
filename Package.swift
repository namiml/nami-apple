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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.5.3/Nami.xcframework-2.5.3.zip",
            checksum: "2ec9996d1165e5786b6e0439846c18268b6cf0995307c4ca2d60d5c6e9529662"
        )
    ]
)
