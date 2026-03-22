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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.9/NamiApple.xcframework-3.3.9-rc.202603221826.zip",
            checksum: "8dab2997ef96ef04a3f24b4836bf9c1a8364536f35606cbe050421c35e532c4f"
        ),
    ]
)
