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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0-rc.03/Nami.xcframework-rc.03.zip",
            checksum: "40eac72c578c2d3581a7c9778584664e4d7601635d0bb7a5ffa561c7387ab3c6"
        )
    ]
)
