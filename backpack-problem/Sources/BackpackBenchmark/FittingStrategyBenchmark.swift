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

    public static func accuracy(of actual: BackpackFittingResult, against reference: BackpackFittingResult) -> ApproximationBenchmark {

        return Double(reference.value - actual.value) / Double(reference.value)
    }
}
