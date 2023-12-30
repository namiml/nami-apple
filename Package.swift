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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.24-beta.01/NamiApple.xcframework-3.1.24-beta.01.zip",
            checksum: "ce2f627946f7ea1bd3a7424317c76a48abb0c2a7dd34c4214079a5ea5d8125d8"
        ),
    ]
)
