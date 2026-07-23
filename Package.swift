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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.7/NamiApple.xcframework-3.4.7-rc.202607230359.zip",
            checksum: "8f1df0486deec230b7884397c921c4b0836f7e67e2bc71694998deef5bc1df4f"
        ),
    ]
)
