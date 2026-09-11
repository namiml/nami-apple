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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.11/NamiApple.xcframework-3.4.11-dev.202609102354.zip",
            checksum: "fc45b6f4c75d89cf13061b23fdc49cd44f86b9dd94a9e725b6065921191fc763"
        ),
    ]
)
