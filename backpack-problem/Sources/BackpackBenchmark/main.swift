//
//  main.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation
import BackpackSolver
import Measurement
import DataFormatter

enum StrategyType: String {
    case dynamic = "0"
    case heuristic = "1"
    case bb = "2"

    var strategy: BackpackFittingStrategyType.Type {
        switch self {
        case .dynamic: return DynamicFittingStrategy.self
        case .heuristic: return BestRatioBackpackFittingStrategy.self
        case .bb: return BBFittingStrategy.self
        }
    }
}

guard CommandLine.arguments.count == 3 else {
    print("No inputs folder specified")
    exit(1)
}

let directory = CommandLine.arguments[1]

guard let strategy = StrategyType(rawValue: CommandLine.arguments[2]) else {
    print("Ukniwn strategy")
    exit(1)
}

func test(instance: BackpackProblemInstance, strategy: BackpackFittingStrategyType.Type) -> (Double) {
    let accb = FittingStrategyBenchmark.duration(strategy: BBFittingStrategy.self, on: instance)
    let solution = BackpackProblemSolution(id: "", backpackValue: accb.result.value)
    let benchmark = FittingStrategyBenchmark.duration(strategy: strategy, on: instance)

    print("benchmark done: \(benchmark.duration)")

    print(solution.backpackValue)
    print(benchmark.result.value)

    return FittingStrategyBenchmark.accuracy(of: benchmark.result, against: solution)
}

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let fileContents = try! filesReader.readFiles(at: URL(fileURLWithPath: directory), ofType: BackpackProblemInstance.self) {
    return $0.lastPathComponent.split(separator: ".").last != "sh"
}

let times = fileContents.map { file -> (Double, Double) in
    let times = file.content.map { test(instance: $0, strategy: strategy.strategy) }
    let averageTime = times.average()!
    let instanceSize = Double(file.fileName.split(separator: "-").last!)!

    print("⚠️ [\(instanceSize) instances] Test case complete")
    print("\t⌙ ℹ️ Average time (All cases): \(averageTime)")

    return (instanceSize, averageTime)
}

let graph = GnuplotGraph(headings: Headings(x: "X", y: "Y"))
let values = times.map { Value.init(x: "\($0.0)", y: "\($0.1)") }

print(graph.render(with: values))
