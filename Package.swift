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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.17/NamiApple.xcframework-3.1.17.zip",
            checksum: "e87e1eb0738639b26947bde2e7d59840d8b6f4258d0fe1f630bb3b047dceb2ca"
        ),
    ]
)
