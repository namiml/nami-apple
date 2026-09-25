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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.12/NamiApple.xcframework-3.4.12-dev.202609251749.zip",
            checksum: "876cbedb008e239dffdd96b09549bc61dfbd6f0cf5287b2fbc43d464098cf874"
        ),
    ]
)
