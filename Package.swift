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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.8.1/Nami.xcframework-2.8.1.zip",
            checksum: "33bdf5109ee8fca7f2a791d8600b0bce70b7c36438b8316a0aa8ca52baee3a25"
        )
    ]
)
