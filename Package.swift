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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.22/NamiApple.xcframework-3.1.22.zip",
            checksum: "2efc68293c1bf6af9ff1dfdcadcba44fddac15dbb1aa16e9df11a7a8df3bf6d3"
        ),
    ]
)
