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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.10/NamiApple.xcframework-3.0.10.zip",
            checksum: "3dd42998eceeb1167b7c35b1711f7cad0a4923265fd92a3fd6d1073c1a412b9a"
        ),
    ]
)
