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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.4/NamiApple.xcframework-3.4.4-dev.202606302327.zip",
            checksum: "000e90ba0cd8400a4f1a4dfbd7cb4ac7c82465506932253c9d150f3a726fb120"
        ),
    ]
)
