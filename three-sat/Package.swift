// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "three-sat",
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0")
    ],
    targets: [
        .target(
            name: "ThreeSAT",
            dependencies: [
                "Commander"
            ]),
        .testTarget(
            name: "ThreeSATTests",
            dependencies: ["ThreeSAT"]
        )
    ]
)
