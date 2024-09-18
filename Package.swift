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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.4-beta.01/NamiApple.xcframework-3.2.4-beta.01.zip",
            checksum: "287ed48003a36c1b579b25b3042c50b58f0944d7eff9bb9fac762e74a7779ec4"
        ),
    ]
)
