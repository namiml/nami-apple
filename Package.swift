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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.10/NamiApple.xcframework-3.4.10-dev.202609040053.zip",
            checksum: "71479bd3b2205d8b588a271017ce2f69a0abffd3a96e465b5d567a41f30c5e8c"
        ),
    ]
)
