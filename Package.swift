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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.7.1/Nami.xcframework-2.7.1.zip",
            checksum: "c7c6f0aedb56138bfb12ca1fdda17d0a804ef8696e4b342dda36ef1ab2d8f548"
        )
    ]
)
