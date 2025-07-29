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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.2.1/NamiApple.xcframework-3.3.2.1.zip",
            checksum: "02245b7bbd1b0b895816e6dc1f1c7ee92a4c8462e4ed43de467ac168fbe8eca6"
        ),
    ]
)
