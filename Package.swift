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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.1.19-beta.01/NamiApple.xcframework-3.1.19-beta.01.zip",
            checksum: "9f55723dd5ee2a531334f7d593b0b572dba917a91c6e42c3caacbd0ecd7359ac"
        ),
    ]
)
