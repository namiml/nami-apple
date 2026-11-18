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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.14/NamiApple.xcframework-3.4.14-rc.202611181706.zip",
            checksum: "07d2cba7c040e1e2fa5ee8c2398dd5aa1b5e14aea90946e8984df312ed4294a2"
        ),
    ]
)
