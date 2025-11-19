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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.5/NamiApple.xcframework-3.3.5.zip",
            checksum: "c9bb0502a05464bcd1af83ada1e7c9e4fbb0c813e78c8a6b96a7748ffd751ca8"
        ),
    ]
)
