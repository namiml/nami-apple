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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.7/NamiApple.xcframework-3.4.7-dev.202607241811.zip",
            checksum: "951421132dac7d7b72fbf0c50b182433bdfaac1d92525430d119be1a8d5094ef"
        ),
    ]
)
