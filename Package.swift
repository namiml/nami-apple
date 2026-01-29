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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.6/NamiApple.xcframework-3.3.6.zip",
            checksum: "5affb7a6e0b3ee83c9d864a038a812ff2063d3b377aa90ab1ebe74be98f9d5fa"
        ),
    ]
)
