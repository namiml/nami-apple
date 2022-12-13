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
            url: "https://packages.namiml.com/NamiSDK/Apple/2.9.6/Nami.xcframework-2.9.6.zip",
            checksum: "a86ea68b4644155bcd4d91fbb53649c67d12c7e8aa300ac9e6e648e5e3063f6b"
        )
    ]
)
