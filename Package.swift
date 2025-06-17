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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.0-beta.04/NamiApple.xcframework-3.3.0-beta.04.zip",
            checksum: "1469f438b5589ec1df8bf295a6d408b3e7eca7ef5a1fc6e634faf3347c82829e"
        ),
    ]
)
