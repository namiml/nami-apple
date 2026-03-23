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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.9/NamiApple.xcframework-3.3.9-rc.202603230049.zip",
            checksum: "ee49381ac0f3bd11a9e5cc1fbc566f6b5dbee6829f223a979e327a959c537f87"
        ),
    ]
)
