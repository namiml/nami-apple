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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.13/NamiApple.xcframework-3.4.13-dev.202610271801.zip",
            checksum: "93b879bca200f04220357c4eaea3edc659e0289ac259b76edcf7b7d44ad99ac3"
        ),
    ]
)
