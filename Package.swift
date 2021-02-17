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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.5.1/Nami.xcframework-2.5.1.zip",
            checksum: "7153c97de6aad8345056bcb3847b338f2dba7b8c7844d9e057a6b0b6b690af7f"
        )
    ]
)
