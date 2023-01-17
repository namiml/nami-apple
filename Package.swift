// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NamiApple",
    products: [
        .library(
            name: "NamiApple",
            targets: ["NamiApple"]),
    ],
    dependencies: [
        // No Nami Dependencies
    ],
    targets: [
        // Nami is a binary XCFramework
	.binaryTarget(
            name: "Nami",
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0/NamiApple.xcframework-3.0.0.zip",
            checksum: "700dbb9927ef72f1072823cc8d38cf00bd2049424bcb376747cc5bae1e62bb04"
        )
    ]
)
