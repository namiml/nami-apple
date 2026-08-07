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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.8/NamiApple.xcframework-3.4.8-rc.202608070207.zip",
            checksum: "339a00d84dbeb284b0cb43a6364dedabc4be8dc93b1b566f09ce7e3fef6bfb16"
        ),
    ]
)
