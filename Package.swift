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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.8/NamiApple.xcframework-3.4.8-dev.202607290252.zip",
            checksum: "9ce5bbabca694363edfbca7dd2c5ddd86db62cb04daebdca291a70966d0e8dbb"
        ),
    ]
)
