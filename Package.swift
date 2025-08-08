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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.2.10/NamiApple.xcframework-3.3.2.10.zip",
            checksum: "b33c473cad71ed5d6b61f4f6450bbb73dccb22fb8838a9d006f9cbc7b4071acb"
        ),
    ]
)
