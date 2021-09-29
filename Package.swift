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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.9.2/Nami.xcframework-2.9.2.zip",
            checksum: "c25dcd9bceb65ca25e0dd56296abcf6b1e16665e0aa54c2f0a2e3b6a40abce66"
        )
    ]
)
