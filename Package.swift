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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.13/NamiApple.xcframework-3.4.13-rc.202610231929.zip",
            checksum: "19032101fb927bdd59c0c533cf7e39c41d71aad168b9453c99567ab57ad76d29"
        ),
    ]
)
