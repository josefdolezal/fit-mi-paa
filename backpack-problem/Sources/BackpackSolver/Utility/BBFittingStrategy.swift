//
//  BBFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 01/11/2017.
//

import Foundation

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

    public static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        let sortedItems = items
            .map { ($0, Double($0.value) / Double($0.weight)) }
            .sorted { $0.1 <= $1.1 }
            .map { $0.0 }
        let itemsReference = Reference(initial: sortedItems)
        let maximumValue = items.reduce(0) { $0 + $1.value }
        let branchNode = BranchNode(maximumValue: maximumValue, capacityLeft: maxWeight, value: 0, itemIndex: 0, items: itemsReference)
        let actualMaximum = Reference(initial: 0)

        // Find solution
        let bestNode = evaluateBranch(from: branchNode, actualMaximum: actualMaximum)

        // No solution found
        guard actualMaximum.value > 0 else { return nil }

        return BackpackFittingResult(weight: bestNode.items.value.reduce(0) { $0 + $1.weight },
                                     value: actualMaximum.value)
    }

    private static func evaluateBranch(from node: BranchNode, actualMaximum: Reference<Int>) -> BranchNode {
        guard
            node.itemAvailable,
            node.potentialValue > actualMaximum.value
        else { return node }

        // Branch
        let (leftBranch, rightBranch) = branch(from: node)

        let leftTree = evaluateBranch(from: leftBranch, actualMaximum: actualMaximum)
        let rightTree = evaluateBranch(from: rightBranch, actualMaximum: actualMaximum)

        // Check for best branch
        let bestSubtree = leftTree.value > rightTree.value ? leftTree : rightTree

        // If best branch is better than current maximum, update the current maximum
        if bestSubtree.value > actualMaximum.value {
            actualMaximum.value = bestSubtree.value

            return bestSubtree
        }

        // Fallback, the current node is the best
        return node
    }

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
