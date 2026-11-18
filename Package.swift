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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.5.0/NamiApple.xcframework-3.5.0-rc.202611180217.zip",
            checksum: "bbdb90390ded7f5ee8874f9b3546d9b6c13ba9358a2d91cec132dd803e513eab"
        ),
    ]
)
