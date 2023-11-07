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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.18-beta.01/NamiApple.xcframework-3.1.18-beta.01.zip",
            checksum: "3fe7427d0877931b83f97ee8d8d332267cb22b6747d0a0a7d554d262460be3bf"
        ),
    ]
)
