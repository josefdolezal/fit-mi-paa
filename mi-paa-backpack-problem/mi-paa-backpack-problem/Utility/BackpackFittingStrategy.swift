//
//  BackpackFittingStrategy.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

typealias BackpackFittingResult = (weight: Int, value: Int)

protocol BackpackFittingStrategyType {
    static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult?
}

class AllCasesBackpackFittingStrategy: BackpackFittingStrategyType {
    static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
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

class BestRatioBackpackFittingStrategy: BackpackFittingStrategyType {

    static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        return items.map { ($0.value, $0.weight, Double($0.value) / Double($0.weight)) }
            .sorted { lhs, rhs in lhs.2 >= rhs.2 }
            .reduce((0, 0) as BackpackFittingResult,
                    while: { $0.weight + $1.1 <= maxWeight }) {

                let newWeight = $0.weight + $1.1

                guard newWeight <= maxWeight else { return $0 }

                return BackpackFittingResult(weight: newWeight, value: $0.value + $1.0)
            }
    }
}
