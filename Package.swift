// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NamiApple",
    products: [
        .library(
            name: "NamiApple",
            targets: ["NamiApple"]
        ),
    ],
    dependencies: [
        // No Nami Dependencies
    ],
    targets: [
        // Nami is a binary XCFramework
        .binaryTarget(
            name: "NamiApple",
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.0/NamiApple.xcframework-3.4.0-dev.202605140019.zip",
            checksum: "dc1cacd296ec3af6af4762d0be95fd86234bb156fd9264047587d3b0a54f46c2"
        ),
    ]
)
