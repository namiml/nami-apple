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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.12/NamiApple.xcframework-3.3.12-rc.202604162049.zip",
            checksum: "f8705708050ccc8c69c3f9e7518b4bee091d779ed2a16a2d3d751ec2e3af15d8"
        ),
    ]
)
