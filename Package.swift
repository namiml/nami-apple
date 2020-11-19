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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.4.0/Nami.xcframework-2.4.0.zip",
            checksum: "ff23e02db2846c92351639aca79fdc1e11f065ccd8218558dfd0046448d6e834"
        )
    ]
)
