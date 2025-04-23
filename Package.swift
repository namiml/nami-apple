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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.2.10-rc.02/NamiApple.xcframework-3.2.10-rc.02.zip",
            checksum: "c49f4a10d787c3df26f7a28f49b2bfa53d62be5ae961524bd3e3cb1e9a94593a"
        ),
    ]
)
