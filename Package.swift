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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.4/NamiApple.xcframework-3.4.4-dev.202607080043.zip",
            checksum: "efd036a4d0e3c802ddd3f97818948ec3b96394e6727687589b835cc05dff1bb9"
        ),
    ]
)
