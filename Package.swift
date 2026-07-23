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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.7/NamiApple.xcframework-3.4.7-dev.202607232219.zip",
            checksum: "20b26a0013cbc714a3e73c9f91ed6baf02c072da0d0ded4cb1d1e6c51af59e8f"
        ),
    ]
)
