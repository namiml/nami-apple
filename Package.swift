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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.28-beta.01/NamiApple.xcframework-3.1.28-beta.01.zip",
            checksum: "d4afb7df3d4970bafbbd48ab64dd071bd103e9715a9ec8727076291983b2f344"
        ),
    ]
)
