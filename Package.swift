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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.0/NamiApple.xcframework-3.4.0-dev.202605120207.zip",
            checksum: "3c359dc73e954b75777eb3f35c4716cf1f63c5e9b42872abbafe0170e0ee0b08"
        ),
    ]
)
