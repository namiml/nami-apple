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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.6/NamiApple.xcframework-3.4.6-dev.202607210443.zip",
            checksum: "8caadeee2a0f869cd7915cde3b48cdb55e71c59144538f2d0dd23ee6ad24f9fc"
        ),
    ]
)
