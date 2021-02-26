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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.5.2/Nami.xcframework-2.5.2.zip",
            checksum: "bf41e8454fc752f8b445707371a02e8295d803fcf10408e1b1aef51621512128"
        )
    ]
)
