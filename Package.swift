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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0-alpha.04/Nami.xcframework-3.0.0-alpha.04.zip",
            checksum: "6f21aa876f9aa44adff83aa833785736e8a74b8d73e0f52509664aa5f6edeeb5"
        )
    ]
)
