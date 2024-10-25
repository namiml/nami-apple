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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.7/NamiApple.xcframework-3.2.7.zip",
            checksum: "47ab14fc406f2ff655f0cc9b316b1011c2a1fb173b9f51ade3ef01f5762bdaae"
        ),
    ]
)
