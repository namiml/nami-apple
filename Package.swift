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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.1/NamiApple.xcframework-3.4.1-dev.202605262144.zip",
            checksum: "58a5005649e7acb4596e3ff8863b23fb389f5c8289bb85aee7ab582c8e9da6e6"
        ),
    ]
)
