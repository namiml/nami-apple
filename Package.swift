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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.3/NamiApple.xcframework-3.4.3.zip",
            checksum: "821519b3a48b5d9d1ee1f16b1a62b6481e53ff8e91e9cd771f6ed64266a9b1e0"
        ),
    ]
)
