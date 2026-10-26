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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.13/NamiApple.xcframework-3.4.13-dev.202610262006.zip",
            checksum: "e28b4a2d49ffb2e577225e4bd726ded10e66ece77e55019cd8a268855a7f8e70"
        ),
    ]
)
