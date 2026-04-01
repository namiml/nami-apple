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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.10/NamiApple.xcframework-3.3.10-rc.202604011637.zip",
            checksum: "bb6fc22efa58de28b17ad30e41c449b4422cd6020fa96d7104b7c4e333cc7fb7"
        ),
    ]
)
