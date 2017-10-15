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

func test(instance: BackpackProblemInstance, against solution: BackpackProblemSolution) -> (duration: Double, approximationError: Double) {

    let allCasesBenchmark = FittingStrategyBenchmark.duration(
        strategy: AllCasesBackpackFittingStrategy.self,
        on: instance)

    let ratioBenchmark = FittingStrategyBenchmark.duration(
        strategy: BestRatioBackpackFittingStrategy.self,
        on: instance)

    let approximationError = FittingStrategyBenchmark.accuracy(
        of: ratioBenchmark.result,
        against: allCasesBenchmark.result)

    if allCasesBenchmark.result.value == solution.backpackValue {
        print("✅ Test \(instance.id) passed in \(allCasesBenchmark.duration)")
    } else {
        print("💥 Test \(instance.id) failed.")
    }

    print("\t⌙ ℹ️ approximation error: \(approximationError * 100) %")

    return (allCasesBenchmark.duration, approximationError)
}

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let instanceGroups = try! filesReader.readFiles(at: URL(string: "./Input")!, ofType: BackpackProblemInstance.self)
let solutionGroups = try! filesReader.readFiles(at: URL(string: "./Output")!, ofType: BackpackProblemSolution.self)

zip(instanceGroups, solutionGroups).prefix(3).forEach { instances, solutions in
    let instancesBenchmark = zip(instances, solutions).map {
        return test(instance: $0, against: $1)
    }

    let durationBenchmark = instancesBenchmark.map { $0.duration }.average() ?? 0
    let approximationBenchmark = instancesBenchmark.map { $0.approximationError }.average() ?? 0

    print("⚠️ [\(instances.first?.backpackItems.count ?? 0) instances] Test case complete")
    print("\t⌙ ℹ️ Average time: \(durationBenchmark)")
    print("\t⌙ ℹ️ Average approximation error: \(approximationBenchmark * 100) %")
}

