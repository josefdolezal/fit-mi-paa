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

func test(instance: BackpackProblemInstance, against solution: BackpackProblemSolution) -> TestResult {
    let allCasesBenchmark = FittingStrategyBenchmark.duration(
        strategy: AllCasesBackpackFittingStrategy.self,
        on: instance)

    let ratioBenchmark = FittingStrategyBenchmark.duration(
        strategy: BestRatioBackpackFittingStrategy.self,
        on: instance)

    let approximationError = FittingStrategyBenchmark.accuracy(
        of: ratioBenchmark.result,
        against: solution)

    if allCasesBenchmark.result.value == solution.backpackValue {
        print("✅ Test \(instance.id) passed in \(allCasesBenchmark.duration)")
    } else {
        print("💥 Test \(instance.id) failed.")
    }

    print("\t⌙ ℹ️ approximation error: \(approximationError * 100) %")

    return TestResult(allCasesDuration: allCasesBenchmark.duration, approximationDuration: ratioBenchmark.duration,
                      approxamationError: approximationError)
}

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let instanceGroups = try! filesReader.readFiles(at: URL(string: "./Input")!, ofType: BackpackProblemInstance.self)
let solutionGroups = try! filesReader.readFiles(at: URL(string: "./Output")!, ofType: BackpackProblemSolution.self)

let benchmarks = zip(instanceGroups, solutionGroups).flatMap { arg -> TestResultBenchmark? in
    let (instances, solutions) = arg
    let instancesBenchmark = zip(instances, solutions).map {
        return test(instance: $0, against: $1)
    }

    guard let resultStats = FittingStrategyBenchmark.stats(for: instancesBenchmark) else { return nil }

    print("⚠️ [\(resultStats.testsCount) instances] Test case complete")
    print("\t⌙ ℹ️ Average time (All cases): \(resultStats.averageAllCasesDuration)")
    print("\t⌙ ℹ️ Average time (Ratio): \(resultStats.averageRatioDuration)")
    print("\t⌙ ℹ️ Average approximation error: \(resultStats.averageRatioDuration * 100) %")
    print("\t⌙ ℹ️ Max approximation error: \(resultStats.maxApproximationError * 100) %")

    return resultStats
}

// Create graph values
let allCasesValues = benchmarks.map { Value(x: "\($0.testsCount)", y: "\($0.averageAllCasesDuration)") }
let rationValues = benchmarks.map { Value(x: "\($0.testsCount)", y: "\($0.averageRatioDuration)") }
let errorRows = benchmarks.map { LatexRow(columns: ["\($0.testsCount)", "\($0.averageApproximationError * 100) %", "\($0.maxApproximationError * 100) %"]) }

let graph = GnuplotGraph(headings: Headings(x: "Number of instances", y: "Average duration"))
print(graph.render(with: allCasesValues))
print(graph.render(with: rationValues))

// Latex table
let table = LatexTable(headings: ["n", "Average approximation error", "Maximum approximation error"])
print(table.render(with: errorRows))
