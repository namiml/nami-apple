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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.5/NamiApple.xcframework-3.1.5.zip",
            checksum: "f4e3d540dbaee654a855d95d7afa0b15f4cd4104f2029d522d16a8a77a45d277"
        ),
    ]
)
