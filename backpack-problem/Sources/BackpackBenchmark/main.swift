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

func test(instance: BackpackProblemInstance, against solution: BackpackProblemSolution) -> (Double, Double) {
    let bbBenchmark = FittingStrategyBenchmark.duration(strategy: FPTASFittingStrategy.self, on: instance)
    let approximation = Double(solution.backpackValue - bbBenchmark.result.value) / Double(solution.backpackValue)

    if bbBenchmark.result.value == solution.backpackValue {
        print("✅ Test \(instance.id) passed in \(bbBenchmark.duration)")
    } else {
        print("💥 Test \(instance.id) failed. (Expected: \(solution.backpackValue), Actual: \(bbBenchmark.result.value)), in \(bbBenchmark.duration)")
    }

    return (bbBenchmark.duration, approximation)
}

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let instanceGroups = try! filesReader.readFiles(at: URL(string: "./Input")!, ofType: BackpackProblemInstance.self)
let solutionGroups = try! filesReader.readFiles(at: URL(string: "./Output")!, ofType: BackpackProblemSolution.self)

let times = zip(instanceGroups, solutionGroups).prefix(7).map { arg -> (Int, Double) in
    let (instances, solutions) = arg
    let instancesBenchmark = zip(instances, solutions).map {
        return test(instance: $0, against: $1)
    }

    let averageTime = instancesBenchmark.map{ $0.0 }.average()!
    let averageError = instancesBenchmark.map { $0.1 }.average()!
    let maxError = instancesBenchmark.map { $0.1 }.max()!

    let instanceSize = instances.first!.backpackItems.count

    print("⚠️ [\(instanceSize) instances] Test case complete")
    print("\t⌙ ℹ️ Average time (All cases): \(averageTime)")
    print("\t⌙ ℹ️ Average error (All cases): \(String(format: "%.2f", averageError * 100))")
    print("\t⌙ ℹ️ Max error (All cases): \(String(format: "%.2f", maxError * 100))")

    return (instanceSize, averageTime)
}

let graph = GnuplotGraph(headings: Headings(x: "X", y: "Y"))
let values = times.map { Value.init(x: "\($0.0)", y: "\($0.1)") }

print(graph.render(with: values))
