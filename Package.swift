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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.5.1/NamiApple.xcframework-3.3.5.1.zip",
            checksum: "9a4885cfaeb6fff1463bec2ee0a04cea8958feb5f53352fc277f1ddaba2f83a4"
        ),
    ]
)
