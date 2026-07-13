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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.5/NamiApple.xcframework-3.4.5-dev.202607132204.zip",
            checksum: "5ca1bec570a0d3a3bdc33d82eae4cfb2b0c402da3f6a371a352cad461190740f"
        ),
    ]
)
