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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.12/NamiApple.xcframework-3.3.12-rc.202604161959.zip",
            checksum: "a64ac79f237a2a58274d3903073cfd7bdb79e98d9483e9fa435f99888bd1e049"
        ),
    ]
)
