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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.1/NamiApple.xcframework-3.4.1-rc.202605282113.zip",
            checksum: "e731d32b0fbe6a01cf7018c83561226f5f825922330a45ce08e8d87fb0cb2d8a"
        ),
    ]
)
