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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.5/NamiApple.xcframework-3.4.5-dev.202607140311.zip",
            checksum: "e811ee51aa1408d64a487ee3d961e510b81e9e870637f053e953ccfac6e91fc6"
        ),
    ]
)
