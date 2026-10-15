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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.5.0/NamiApple.xcframework-3.5.0-dev.202610151928.zip",
            checksum: "3c77aa3e217068fdf0aa9f1ac35b225aac4c4a3089e552b5a5d45a1584443cda"
        ),
    ]
)
