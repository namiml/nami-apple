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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.0-beta.05/NamiApple.xcframework-3.3.0-beta.05.zip",
            checksum: "3a6f82485d420c261c8b3e57d4949428b5501318e31c855fd07c19bb3abd2ddd"
        ),
    ]
)
