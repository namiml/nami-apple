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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.0-beta.01/NamiApple.xcframework-3.2.0-beta.01.zip",
            checksum: "ca9c237bdac5a8a4649eea1330416125a593692841962a03d5a5caf680ed8fbc"
        ),
    ]
)
