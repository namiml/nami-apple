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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.9/NamiApple.xcframework-3.4.9-dev.202608141551.zip",
            checksum: "c68ba3e7505283a4b3118a461a17ebb5efdecbb9783524e6f9ffc5c1ad6ea20d"
        ),
    ]
)
