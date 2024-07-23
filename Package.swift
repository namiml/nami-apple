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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.1-beta.02/NamiApple.xcframework-3.2.1-beta.02.zip",
            checksum: "c570c8aa8339fb8913d1253b31a548bcab4ce913ee5ad8ce5511d1469f66ff1a"
        ),
    ]
)
