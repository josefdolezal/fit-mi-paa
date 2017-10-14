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
            targets: ["BackpackSolver"])
    ],
    targets: [
        .target(
            name: "BackpackSolver",
            dependencies: []),
        .target(
            name: "BackpackBenchmark",
            dependencies: ["BackpackSolver"]),
        .testTarget(
            name: "BackpackSolverTests",
            dependencies: ["BackpackSolver"]),
    ]
)
