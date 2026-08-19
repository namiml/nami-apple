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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.10/NamiApple.xcframework-3.4.10-dev.202608190602.zip",
            checksum: "aea0c9c01e586711ae8b08802e7b8e536ec96d02a8be40b71117126ea58def9f"
        ),
    ]
)
