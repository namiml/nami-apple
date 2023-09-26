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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.12-rc.01/NamiApple.xcframework-3.1.12-rc.01.zip",
            checksum: "cf987667e4384603abe7047baa9a35a768642695c8d60096b9d9cb7ece4a513c"
        ),
    ]
)
