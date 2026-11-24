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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.5.0/NamiApple.xcframework-3.5.0-dev.202611241654.zip",
            checksum: "4a2589db30c51163280a999ea5afc884a1dec0b5bc77c004ae7448892578ba4f"
        ),
    ]
)
