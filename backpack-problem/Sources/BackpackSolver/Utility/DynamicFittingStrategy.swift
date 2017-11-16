//
//  DynamicFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 15/11/2017.
//

import Foundation

public class DynamicFittingStrategy: BackpackFittingStrategyType {

    typealias Table = Reference<[[Int]]>
    typealias Items = Reference<[BackpackItem]>

    public static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        let maximalPrice = items.reduce(0) { $0 + $1.value }
        // Rows: items, columns: price
        let table: [[Int]] = Array(
            repeating: Array(repeating: 0, count: maximalPrice + 1),
            count: items.count + 1)
        let tableReference = Reference(initial: table)
        let itemsReference = Reference(initial: items)

        // Branch the algorithm: a) Insert item, b) Do not insert item
        evaluate(table: tableReference, with: itemsReference, maximalWeight: maxWeight)

        // Interpret solution from table
        return interpret(table: tableReference, items: itemsReference)
    }

    static func evaluate(table: Table, with items: Items, maximalWeight: Int, itemIndex: Int = 0,
                         currentPrice: Int = 0, currentWeight: Int = 0) {

        let nextItemIndex = itemIndex + 1

        // Write the new weight into shared table
        let originalWeight = table.value[itemIndex][currentPrice]
        let newWeight = (originalWeight == 0 || originalWeight > currentWeight) ? currentWeight : originalWeight

        table.value[itemIndex][currentPrice] = newWeight

        // Stop recursion if the item index exceeds the items count
        guard nextItemIndex < items.value.count + 1 else { return }

        let stepPrice = currentPrice + items.value[itemIndex].value
        let stepWeight = newWeight + items.value[itemIndex].weight

        // Check if next step mey be done, if so - run recursion
        if stepWeight <= maximalWeight && newWeight == currentWeight {
            evaluate(table: table, with: items, maximalWeight: maximalWeight, itemIndex: nextItemIndex,
                     currentPrice: stepPrice, currentWeight: stepWeight)
        }

        // Try to evaluate without putting current item into backpack
        evaluate(table: table, with: items, maximalWeight: maximalWeight, itemIndex: nextItemIndex,
                 currentPrice: currentPrice, currentWeight: newWeight)
    }

    // Find the solution in given table
    static func interpret(table: Table, items: Items) -> BackpackFittingResult? {
        guard let lastRow = table.value.last?.reversed() else { return nil }

        // Return first non-zero solution
        for (value, weight) in lastRow.enumerated() {
            if weight != 0 {
                // The -1 is for 0 price
                return BackpackFittingResult(weight: weight, value: lastRow.count - value - 1)
            }
        }

        // Fallback when no solution was found
        return nil
    }
}
