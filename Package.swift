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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.13/NamiApple.xcframework-3.4.13-dev.202610230248.zip",
            checksum: "251ee932867b4d9d76f1086a04d483c6697ed247c75607ead8ecad3bf28d6352"
        ),
    ]
)
