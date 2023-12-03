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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.21-beta.03/NamiApple.xcframework-3.1.21-beta.03.zip",
            checksum: "5877bcac31ef1cd1bf91dce41ba1993d8d8bf845fd0cb6ac9f86469195561a96"
        ),
    ]
)
