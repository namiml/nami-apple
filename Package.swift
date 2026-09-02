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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.10/NamiApple.xcframework-3.4.10-dev.202609022103.zip",
            checksum: "65c8692d7eca9e297c84287bb1fed88ef524b4ea6836ee85d8c3f0a533325d6d"
        ),
    ]
)
