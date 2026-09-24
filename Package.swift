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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.12/NamiApple.xcframework-3.4.12-dev.202609241908.zip",
            checksum: "652dfabfba945a387a6b02ffd8130bc91275fbc8ad9c71ce18fb22adf0e33387"
        ),
    ]
)
