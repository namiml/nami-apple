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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.4.4/Nami.xcframework-2.4.4.zip",
            checksum: "bdfe068e6362e9db5b0d45aeaa1a6a5777b1f00787f4027a75cf25e7a5118fbc"
        )
    ]
)
