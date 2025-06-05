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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.0-beta.03/NamiApple.xcframework-3.3.0-beta.03.zip",
            checksum: "f8c58c7a6297745d95d8e7bc9d87bbc726477289d80f9c3822f13c5e81b30790"
        ),
    ]
)
