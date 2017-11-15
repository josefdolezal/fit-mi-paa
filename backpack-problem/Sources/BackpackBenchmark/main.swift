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

func test(instance: BackpackProblemInstance, against solution: BackpackProblemSolution) -> Double {
    let bbBenchmark = FittingStrategyBenchmark.duration(strategy: BBFittingStrategy.self, on: instance)

    if bbBenchmark.result.value == solution.backpackValue {
        print("✅ Test \(instance.id) passed in \(bbBenchmark.duration)")
    } else {
        print("💥 Test \(instance.id) failed. (Expected: \(solution.backpackValue), Actual: \(bbBenchmark.result.value))")
    }

    return bbBenchmark.duration
}

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let instanceGroups = try! filesReader.readFiles(at: URL(string: "./Input")!, ofType: BackpackProblemInstance.self)
let solutionGroups = try! filesReader.readFiles(at: URL(string: "./Output")!, ofType: BackpackProblemSolution.self)

zip(instanceGroups, solutionGroups).forEach { arg in
    let (instances, solutions) = arg
    let instancesBenchmark = zip(instances, solutions).map {
        return test(instance: $0, against: $1)
    }

    guard let averageTime = instancesBenchmark.average() else { return }

    print("⚠️ [\(instancesBenchmark.count) instances] Test case complete")
    print("\t⌙ ℹ️ Average time (All cases): \(averageTime)")
}
