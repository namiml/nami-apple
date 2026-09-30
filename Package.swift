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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.12/NamiApple.xcframework-3.4.12-dev.202609302156.zip",
            checksum: "a4b4e448fd23a32e2cf0d42e6c43fac19cac080efc08eaf3a9c84ce03deef745"
        ),
    ]
)
