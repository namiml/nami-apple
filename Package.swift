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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.5/NamiApple.xcframework-3.4.5-dev.202607132146.zip",
            checksum: "0054bd8aa552f19764ad2cab5369e981818de6c7e68f9a36bc460b05ad326c1c"
        ),
    ]
)
