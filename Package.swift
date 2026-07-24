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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.7/NamiApple.xcframework-3.4.7-dev.202607241910.zip",
            checksum: "2f0cdc8197c7b9a1cd343f6de563ea70bd335a81eef5463337f3f352c78ee0dc"
        ),
    ]
)
