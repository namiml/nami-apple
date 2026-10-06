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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.12/NamiApple.xcframework-3.4.12-dev.202610062108.zip",
            checksum: "43f075796314eee7bc5b3dab7523873de5b604409da6d8a541f0cdd1e109cdb1"
        ),
    ]
)
