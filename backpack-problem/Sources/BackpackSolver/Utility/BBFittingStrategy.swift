//
//  BBFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 01/11/2017.
//

import Foundation

// Reference semantic for value types
// Allows value types to be passed as reference instead of shallow copy
class Reference<T> {
    var value: T

    init(initial value: T) {
        self.value = value
    }
}

public class BBFittingStrategy: BackpackFittingStrategyType {
    private struct BranchNode {
        // Top bound
        let maximumValue: Int
        let capacityLeft: Int
        // Actual price
        let value: Int
        // Current item index
        let itemIndex: Int

        let items: Reference<[BackpackItem]>

        // The maximal value this branch offers
        var potentialValue: Int { return maximumValue + value }
        var itemAvailable: Bool { return itemIndex < items.value.count }
    }

    static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        return nil
    }

    private static func branch(from node: BranchNode) -> (left: BranchNode, right: BranchNode) {
        guard let nodeItem = node.items.first else {
            fatalError("The node item must be presented.")
        }

        var branchedItems = node.items
        branchedItems.removeFirst()
    private static func branch(from node: BranchNode) -> (left: BranchNode, right: BranchNode) {
        let nodeItem = node.items.value[node.itemIndex]
        let newItemIndex = node.itemIndex + 1

        // Assume that node item is presented in left branch
        // Substract the 'value' from
        let left = BranchNode(maximumValue: node.maximumValue - nodeItem.value,
                              capacityLeft: node.capacityLeft - nodeItem.weight,
                              value: node.value + nodeItem.value, itemIndex: newItemIndex, items: node.items)
        // Assume that node is not presented in right branch
        let right = BranchNode(maximumValue: node.maximumValue - nodeItem.value,
                               capacityLeft: node.capacityLeft,
                               value: node.value, itemIndex: newItemIndex, items: node.items)

        // As left tree may exceed the capacity, check for that
        let sanitizedLeft = left.capacityLeft < 0 ? right : left

        return (sanitizedLeft, right)
    }
}
