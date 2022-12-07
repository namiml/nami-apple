// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NamiApple",
    products: [
        .library(
            name: "NamiApple",
            targets: ["NamiApple"]),
    ],
    dependencies: [
        // No Nami Dependencies
    ],
    targets: [
        // Nami is a binary XCFramework
	.binaryTarget(
            name: "Nami",
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0-rc.07/NamiApple.xcframework-3.0.0-rc.07.zip",
            checksum: "cf50af588e517eb9e9a5024d816efbf6ca6f1687207e0256d513cfc8442ddc3b"
        )
    ]
)
