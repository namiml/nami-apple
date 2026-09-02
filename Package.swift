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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.10/NamiApple.xcframework-3.4.10-dev.202609020156.zip",
            checksum: "5b07ad903f08008391a60f31f88b5a8fbe7b3fa9568a7550bd4423fb0dc07afa"
        ),
    ]
)
