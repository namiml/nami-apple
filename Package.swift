// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nami",
    products: [
        .library(
            name: "Nami",
            targets: ["Nami"]),
    ],
    dependencies: [
        // No Nami Dependencies
    ],
    targets: [
        // Nami is a binary XCFramework
	.binaryTarget(
            name: "Nami",
            url: "https://packages.namiml.com/NamiSDK/Apple/2.9.1/Nami.xcframework-2.9.1.zip",
            checksum: "9aef2adf52425aa35399858b22b57c2bc410610897d3973d20c0b5c9ed8bd69d"
        )
    ]
)
