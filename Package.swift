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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.21-beta.01/NamiApple.xcframework-3.1.21-beta.01.zip",
            checksum: "9585800df64df4c8ffa2448eaaa2e879860f5b731551a57f9ab3e5395ecea709"
        ),
    ]
)
