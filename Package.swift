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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.21-beta.02/NamiApple.xcframework-3.1.21-beta.02.zip",
            checksum: "1e451308761524693d90e122a4b774dfd1207bd89833c520d0ca5033dfc07baf"
        ),
    ]
)
