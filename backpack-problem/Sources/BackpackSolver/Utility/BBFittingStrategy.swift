//
//  BBFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 01/11/2017.
//

import Foundation

class BBFittingStrategy: BackpackFittingStrategyType {
    private struct BranchNode {
        let maximalPossibleValue: Int
        let capacityLeft: Int
        let value: Int

        let items: [BackpackItem]
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

        // Assume that node item is presented in left branch
        let left = BranchNode(maximalPossibleValue: 0, capacityLeft: node.capacityLeft - nodeItem.weight,
                              value: node.value + nodeItem.value, items: branchedItems)
        // Assume that node is not presented in right branch
        let right = BranchNode(maximalPossibleValue: 0, capacityLeft: node.capacityLeft,
                               value: node.value, items: branchedItems)

        return (left, right)
    }
}
