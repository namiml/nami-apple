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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0-alpha.05/Nami.xcframework-3.0.0-alpha.05.zip",
            checksum: "997ae55e0d6a4b9e0d3443c4466d0aaf131169623782d49b1eb888c000055610"
        )
    ]
)
