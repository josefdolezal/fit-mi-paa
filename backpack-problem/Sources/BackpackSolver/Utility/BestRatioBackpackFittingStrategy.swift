//
//  BestRatioBackpackFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 01/11/2017.
//

import Foundation

public class BestRatioBackpackFittingStrategy: BackpackFittingStrategyType {

    public static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        return items.map { ($0.value, $0.weight, Double($0.value) / Double($0.weight)) }
            .sorted { lhs, rhs in lhs.2 >= rhs.2 }
            .reduce((0, 0) as BackpackFittingResult) {
                let newWeight = $0.weight + $1.1

                guard newWeight <= maxWeight else { return $0 }

                return BackpackFittingResult(weight: newWeight, value: $0.value + $1.0)
        }
    }
}
