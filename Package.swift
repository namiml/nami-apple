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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.1/NamiApple.xcframework-3.4.1-dev.202605300006.zip",
            checksum: "b986eff71f5be4b04c0cd84c0da2d113768065c024ecaec21a8773e33990aaa8"
        ),
    ]
)
