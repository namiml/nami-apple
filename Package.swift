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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.0/NamiApple.xcframework-3.4.0-dev.202605140429.zip",
            checksum: "d8861dac79fe3f81f7c4d93bf75a44a4bf8a9e128c0b7c741a2edcf506fc5f7d"
        ),
    ]
)
