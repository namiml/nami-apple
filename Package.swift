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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.9/NamiApple.xcframework-3.4.9-dev.202608172110.zip",
            checksum: "3d6887b8beeeb11241c6fcd456aa6c3a66a6f05436072561ae4db6b42e3a8fc1"
        ),
    ]
)
