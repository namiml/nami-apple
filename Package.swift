// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NamiApple",
    products: [
        .library(
            name: "NamiApple",
            targets: ["NamiApple"]
        ),
    ],
    dependencies: [
        // No Nami Dependencies
    ],
    targets: [
        // Nami is a binary XCFramework
        .binaryTarget(
            name: "NamiApple",
            url: "https://packages.namiml.com/NamiSDK/Apple/3.4.3/NamiApple.xcframework-3.4.3-rc.202606201353.zip",
            checksum: "554663ccbd5a45ae4f2eff4eceaed15089c8c3bc52f9dc768be48e55c08745a3"
        ),
    ]
)
