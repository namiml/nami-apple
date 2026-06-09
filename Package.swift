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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.2/NamiApple.xcframework-3.4.2-dev.202606090438.zip",
            checksum: "8ace0052485a448481e98ef42e7bd6dd8745dc4934886380ada5f2b4b74b6042"
        ),
    ]
)
