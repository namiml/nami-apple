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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.10-rc.01/NamiApple.xcframework-3.2.10-rc.01.zip",
            checksum: "50da8f2ffd36cefccf639faf639b474e7240b4f10ba58b10793b18466f93af6d"
        ),
    ]
)
