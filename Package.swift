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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.1/NamiApple.xcframework-3.3.1.zip",
            checksum: "e82973f7a1f2d4b0211e096234d4f68b1dc09b2a1c3b592d3e9da973ce0fbcfd"
        ),
    ]
)
