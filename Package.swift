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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.0-beta.02/NamiApple.xcframework-3.3.0-beta.02.zip",
            checksum: "d0dc167cfdba26b4007dd322c8a6baabc60f6f10621bbb9b5a60635c0d57c6b6"
        ),
    ]
)
