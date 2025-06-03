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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.0-beta.01/NamiApple.xcframework-3.3.0-beta.01.zip",
            checksum: "30fa6827a392050f13929e341f28c7f30391e0b4a72ae4914087a5b362126c4d"
        ),
    ]
)
