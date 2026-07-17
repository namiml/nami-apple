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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.6/NamiApple.xcframework-3.4.6-dev.202607170339.zip",
            checksum: "88422c7a93b8869e0cd19e28dc9fa491c614a000c897eeb45abef796180b7ba3"
        ),
    ]
)
