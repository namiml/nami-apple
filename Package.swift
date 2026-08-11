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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.8/NamiApple.xcframework-3.4.8-dev.202608111549.zip",
            checksum: "9aeea53d8a22dff8cb4483e5ec453307c171b0e608939ac2140a1ca56c3091d8"
        ),
    ]
)
