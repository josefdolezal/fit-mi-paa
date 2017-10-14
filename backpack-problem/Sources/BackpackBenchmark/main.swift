//
//  main.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation
import BackpackSolver

func test(instance: BackpackProblemInstance, against solution: BackpackProblemSolution) -> Double {
    let backpack = Backpack(maxWeight: instance.backpackMaxWeight)
    let start = CFAbsoluteTimeGetCurrent()

    let fittingResult = backpack.fit(items: instance.backpackItems, using: AllCasesBackpackFittingStrategy.self)
    let duration = CFAbsoluteTimeGetCurrent() - start

    if fittingResult.value == solution.backpackValue {
        print("✅ Test \(instance.id) passed in \(duration)")
    } else {
        print("🚫 Test \(instance.id) failed in \(duration)")
    }

    return duration
}

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let instanceGroups = try! filesReader.readFiles(at: URL(string: "./Input")!, ofType: BackpackProblemInstance.self)
let solutionGroups = try! filesReader.readFiles(at: URL(string: "./Output")!, ofType: BackpackProblemSolution.self)

for group in zip(instanceGroups, solutionGroups) {
    let (instances, solutions) = group

    let instancesBenchmark = zip(instances, solutions).map { configuration -> Double in
        let (instance, solution) = configuration

        return test(instance: instance, against: solution)
    }.average() ?? 0

    print("⚠️ Average time for instances: \(instancesBenchmark)")
}
