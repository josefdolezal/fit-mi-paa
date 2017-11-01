// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "BackpackProblem",
    products: [
        .executable(
            name: "BackpackBenchmark",
            targets: ["BackpackBenchmark"]),
        .library(
            name: "BackpackSolver",
            targets: ["BackpackSolver"]),
        .library(
            name: "Measurement",
            targets: ["Measurement"])
    ],
    targets: [
        .target(
            name: "BackpackSolver",
            dependencies: []),
        .target(
            name: "BackpackBenchmark",
            dependencies: ["BackpackSolver", "Measurement"]),
        .target(
            name: "Measurement",
            dependencies: []),
        .target(
            name: "DataFormatter",
            dependencies: []),
        .testTarget(
            name: "BackpackSolverTests",
            dependencies: ["BackpackSolver", "DataFormatter", "BackpackBenchmark"]),
    ]
)
