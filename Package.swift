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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.11/NamiApple.xcframework-3.4.11-dev.202609152233.zip",
            checksum: "7a70da2a3cd3d0f9e860ae8bb1fb528b6c79c6034f58c719262d0b75f53b8c45"
        ),
    ]
)
