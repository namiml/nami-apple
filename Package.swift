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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.6/NamiApple.xcframework-3.4.6-dev.202607171903.zip",
            checksum: "ed3596036ae9c8b8344dd80a469b4cd0d3020f70cc64365ec7c335605f31720e"
        ),
    ]
)
