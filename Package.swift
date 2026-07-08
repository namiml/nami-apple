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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.4/NamiApple.xcframework-3.4.4-rc.202607080215.zip",
            checksum: "7d0ffff41c811d9b2fd1189433d3b437bb41282714608dfb78f96d4fbe43554d"
        ),
    ]
)
