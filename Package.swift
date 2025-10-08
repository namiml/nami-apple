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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.3.3.5/NamiApple.xcframework-3.3.3.5.zip",
            checksum: "030c82e8b069e73423ddbdb1f7d594d32fb985386b3e15412b91a73b8af21cde"
        ),
    ]
)
