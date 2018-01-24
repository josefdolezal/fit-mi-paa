// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "three-sat",
    dependencies: [],
    targets: [
        .target(
            name: "ThreeSAT",
            dependencies: []),
        .testTarget(
            name: "ThreeSATTests",
            dependencies: ["ThreeSAT"]
        )
    ]
)
