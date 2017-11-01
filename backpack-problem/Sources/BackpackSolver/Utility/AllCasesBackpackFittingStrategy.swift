//
//  AllCasesBackpackFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 01/11/2017.
//

import Foundation

public class AllCasesBackpackFittingStrategy: BackpackFittingStrategyType {
    public static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        return items.subsets
            .map(benchMarkAttempt)
            .filter { $0.weight <= maxWeight }
            .max { $0.value <= $1.value }
    }

    private static func benchMarkAttempt(with items: [BackpackItem]) -> BackpackFittingResult {
        return items.reduce((0, 0) as BackpackFittingResult) {
            return BackpackFittingResult(weight: $0.weight + $1.weight, value: $0.value + $1.value)
        }
    }
}
