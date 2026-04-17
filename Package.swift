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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.12/NamiApple.xcframework-3.3.12.zip",
            checksum: "95040124883e6b69f31d6c86e5f270e18a4ceea1f70d3c167191fa9001d0600f"
        ),
    ]
)
