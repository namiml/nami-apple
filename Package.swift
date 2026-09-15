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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.11/NamiApple.xcframework-3.4.11-dev.202609152323.zip",
            checksum: "042950379bf52f79f1fff6bee0b4cdfeb98c40f41b8ea095ad91d38956732457"
        ),
    ]
)
