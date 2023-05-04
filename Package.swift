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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.8/NamiApple.xcframework-3.0.8.zip",
            checksum: "7fa1fef024f4700c511a8e0d739bf51426b787b0ab0d42d5b3d22a7f66db10a3"
        ),
    ]
)
