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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.5.0/NamiApple.xcframework-3.5.0-dev.202610202250.zip",
            checksum: "b1249a0f21df70e89a5a2fd588c886b1eb8d21508c9cad8f5943daca6b9ed8d0"
        ),
    ]
)
