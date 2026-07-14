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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.5/NamiApple.xcframework-3.4.5-dev.202607141645.zip",
            checksum: "9880d757a0ec2501b6f672e6f14746d196bdc72f98bfd4d2b0bae3c858144974"
        ),
    ]
)
