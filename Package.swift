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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.6/NamiApple.xcframework-3.4.6-dev.202607162107.zip",
            checksum: "6b677cc3b26f7543cbbd926c545dc82ad2df340a5a26a9151d0926ae90766c9b"
        ),
    ]
)
