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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.28-beta.02/NamiApple.xcframework-3.1.28-beta.02.zip",
            checksum: "4a63f3b07361551b6d4eac74c7117aa2e8c54427518c069658588a550fbca829"
        ),
    ]
)
