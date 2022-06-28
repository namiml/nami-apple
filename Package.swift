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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0-rc.01/Nami.xcframework-3.0.0-rc.01.zip",
            checksum: "9e3cc4a557a020c123937ebb4e2ab0eb15ce8eb5d22ab3b9f3239c48b7acb077"
        )
    ]
)
