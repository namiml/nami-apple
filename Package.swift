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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.5.0/NamiApple.xcframework-3.5.0-dev.202610151858.zip",
            checksum: "03296ff7330a12d88525d5cd7518a6e3173c8bdc7a6719bad3b40a1fcf8bb656"
        ),
    ]
)
