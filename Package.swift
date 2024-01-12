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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.28-beta.03/NamiApple.xcframework-3.1.28-beta.03.zip",
            checksum: "afeee1b3a4b8c48ebe89095cddd8e9a2f316c3a06ecc2a2dc095bfee33afe59a"
        ),
    ]
)
