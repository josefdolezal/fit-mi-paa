//
//  FittingStrategyBenchmark.swift
//  BackpackBenchmark
//
//  Created by Josef Dolezal on 15/10/2017.
//

import Measurement
import BackpackSolver

public typealias ApproximationBenchmark = Double

public struct DurationBenchmark {
    public let duration: Duration
    public let result: BackpackFittingResult
}

public class FittingStrategyBenchmark {
    public static func duration(strategy: BackpackFittingStrategyType.Type,
                               on instance: BackpackProblemInstance) -> DurationBenchmark {

        let backpack = Backpack(maxWeight: instance.backpackMaxWeight)
        let fittingResult = Measurement.measure {
            return backpack.fit(items: instance.backpackItems, using: strategy)
        }

        return DurationBenchmark(duration: fittingResult.duration, result: fittingResult.result)
    }

    public static func accuracy(of actual: BackpackFittingResult, against solution: BackpackProblemSolution) -> ApproximationBenchmark {

        return Double(solution.backpackValue - actual.value) / Double(solution.backpackValue)
    }

    public static func stats(for testResults: [TestResult]) -> TestResultBenchmark? {
        guard testResults.count > 0 else { return nil }

        let approximationErrors = testResults.map { $0.approxamationError }

        let allCasesDuration = testResults.map { $0.allCasesDuration }.average()!
        let ratioDuration = testResults.map { $0.approximationDuration }.average()!
        let averageError = approximationErrors.average()!
        let maxError = approximationErrors.max()!

        return TestResultBenchmark(testsCount: testResults.count,
                                   averageAllCasesDuration: allCasesDuration,
                                   averageRatioDuration: ratioDuration,
                                   averageApproximationError: averageError,
                                   maxApproximationError: maxError)
    }
}
