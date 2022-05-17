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
            url: "https://packages.namiml.com/NamiSDK/Apple/3.0.0-alpha.01/Nami.xcframework-3.0.0-alpha.01.zip",
            checksum: "cbfaa56a7071a037539d8214e2805d9c74720c159c6bcaa469d9243ab182616e"
        )
    ]
)
