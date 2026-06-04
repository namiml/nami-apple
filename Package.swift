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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.2/NamiApple.xcframework-3.4.2-rc.202606042212.zip",
            checksum: "5a82b00eed783e222cfa12c2d14dbb90078305aafba3532d8daf2c0dcf06e23c"
        ),
    ]
)
