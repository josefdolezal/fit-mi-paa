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

func test(instance: BackpackProblemInstance, against solution: BackpackProblemSolution, strategy: BackpackFittingStrategyType.Type) -> (Double, Double) {
    let durationBenchmark = FittingStrategyBenchmark.duration(strategy: strategy, on: instance)
    let accuracyBenchmark = FittingStrategyBenchmark.accuracy(of: durationBenchmark.result, against: solution)

    return (durationBenchmark.duration, accuracyBenchmark * 100)
}

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let inputs = try! filesReader.readFiles(at: URL(fileURLWithPath: "Input"), ofType: BackpackProblemInstance.self)
let outputs = try! filesReader.readFiles(at: URL(fileURLWithPath: "Output"), ofType: BackpackProblemSolution.self)

let times = zip(inputs, outputs).map { input, output -> (Int, Double) in
    let fileBenchmarks = zip(input.content, output.content).map { instance, solution in
        return test(instance: instance, against: solution, strategy: SimulatedAnnealingFittingStrategy.self)
    }
    let size = input.content.first!.backpackItems.count
    let times = fileBenchmarks.map { $0.0 }
    let accuracies = fileBenchmarks.map { $0.1 }
    let averageTime = times.average()!
    let averageAccuracy = accuracies.average()!

    print("⚠️ [\(size)] Test case complete")
    print("\t⌙ ℹ️ Average time: \(averageTime)")
    print("\t⌙ ℹ️ Average accuracy: \(averageAccuracy) %")

    return (size, averageTime)
}

let graph = GnuplotGraph(headings: Headings(x: "X", y: "Y"))
let values = times.map { Value.init(x: "\($0.0)", y: "\($0.1)") }

print(graph.render(with: values))
