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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.1-beta.01/NamiApple.xcframework-3.2.1-beta.01.zip",
            checksum: "fdbd6e4e1839f2e597c311b33834bbd735b288a5f92ed8f08af1530db161a9ba"
        ),
    ]
)
