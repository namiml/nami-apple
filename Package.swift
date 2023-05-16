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
            name: "Nami",
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.9.1/NamiApple.xcframework-3.0.9.1.zip",
            checksum: "33f1a3d7dd0db806c9dcb510b2b5e86a9370a26b673e427d0cf650518ff7eb2e"
        ),
    ]
)
