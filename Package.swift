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
            name: "NamiApple",
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.5/NamiApple.xcframework-3.0.5.zip",
            checksum: "2a119ca78e600fa9012f17f5147a14cb0f314fc7eed80dd05d73c90a6d5f9a1b"
        )
    ]
)
