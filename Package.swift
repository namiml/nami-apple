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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.1.2/NamiApple.xcframework-3.3.1.2.zip",
            checksum: "d14df5a159bcf2492075e98a72a61c8b6bf2ea39d2652b8c0c7fcc7a89d60c56"
        ),
    ]
)
