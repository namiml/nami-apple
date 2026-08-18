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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.9/NamiApple.xcframework-3.4.9-dev.202608181529.zip",
            checksum: "d56de3fa747c5ba1521fad380bb3c1389723a657ca331920ad5f2945070c7cee"
        ),
    ]
)
