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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.10-beta.01/NamiApple.xcframework-3.2.10-beta.01.zip",
            checksum: "add203ef2d3da5cff2edec2b992f157b07b04c1f505b0f626e17f4555ac29653"
        ),
    ]
)
