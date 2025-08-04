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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.2.6/NamiApple.xcframework-3.3.2.6.zip",
            checksum: "3b1ec464d9fb5b4951ef98fb45a626ee4bb4f9ff2be01bb3fd0d2f485a61daac"
        ),
    ]
)
