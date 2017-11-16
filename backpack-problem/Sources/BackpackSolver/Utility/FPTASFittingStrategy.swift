//
//  FPTASFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 16/11/2017.
//

import Foundation

public class FPTASFittingStrategy: BackpackFittingStrategyType {
    public static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        return fit(items: items, maxWeight: maxWeight, accuracy: 0.00001)
    }

    public static func fit(items: [BackpackItem], maxWeight: Int, accuracy: Double) -> BackpackFittingResult? {
        guard let maxValue = items.map({ $0.value }).max() else { return nil }

        // Create epsilon from sanitized accuracy from interval (0, 1]
        let epsilon = 1 - min(1, max(0, accuracy))
        let factor = epsilon * Double(maxValue) / Double(items.count)

        // Update the items price with computed factor
        let updatedItems = items.map { oldItem -> BackpackItem in
            let newPrice = Int(Double(oldItem.value) / factor)
            return BackpackItem(value: newPrice, weight: oldItem.weight)
        }

        // Compute the solution using dynamic programming approach on updated items
        guard let solution = DynamicFittingStrategy.fit(items: updatedItems, maxWeight: maxWeight) else { return nil }

        // 'Correct' the solution using factor
        return BackpackFittingResult(weight: solution.weight, value: Int(Double(solution.value) * factor))
    }
}
