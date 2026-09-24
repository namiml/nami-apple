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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.12/NamiApple.xcframework-3.4.12-dev.202609241021.zip",
            checksum: "9e99a9b7c19e5f179923c49870e24028ae5199c26446cbd9b7b2482a3cfa8ce8"
        ),
    ]
)
