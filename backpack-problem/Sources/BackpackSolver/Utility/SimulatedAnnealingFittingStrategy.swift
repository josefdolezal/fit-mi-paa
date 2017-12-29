//
//  SimulatedAnnealingFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 27/12/2017.
//

import Foundation

class SimulatedAnnealingFittingStrategy: BackpackFittingStrategyType {
    static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult? {
        return nil
    }

    private static func neighborSolution(for skeleton: BackpackSolutionSkeleton,
                                         with maxWeight: Int, retriesCount: Int) -> BackpackSolutionSkeleton {

        for _ in 0...retriesCount {
            let newSolution = skeleton.neighbor()

            if newSolution.weight <= maxWeight {
                return newSolution
            }
        }

        return skeleton
    }

    private static func randomSolution(for items: [BackpackItem], maxWeight: Int) -> BackpackSolutionSkeleton {
        let randomSkeleton = items.map { _ in Random.boolean() }
        let (value, weight) = zip(items, randomSkeleton)
            .filter { items, included in included }
            .map { item, _ in item }
            .reduce((0, 0)) { intermediate, item in (intermediate.0 + item.value, intermediate.1 + item.weight) }

        if weight <= maxWeight {
            return BackpackSolutionSkeleton(value: value, weight: weight, items: items, skeleton: randomSkeleton)
        }

        return randomSolution(for: items, maxWeight: maxWeight)
    }
}

struct BackpackSolutionSkeleton {
    let value: Int
    let weight: Int

    private let items: Reference<[BackpackItem]>
    private let skeleton: [Bool]

    init(value: Int, weight: Int, items: [BackpackItem], skeleton: [Bool]) {
        self.value = value
        self.weight = weight
        self.items = Reference(initial: items)
        self.skeleton = skeleton
    }

    func neighbor() -> BackpackSolutionSkeleton {
        let switchedIndex = Random.withUpperBound(items.value.count)
        let switchedIndexValue = !skeleton[switchedIndex]
        let switchedItem = items.value[switchedIndex]
        let newValue = value + switchedIndexValue.map { $0 ? switchedItem.value : -switchedItem.value }
        let newWeight = weight + switchedIndexValue.map { $0 ? switchedItem.weight : switchedItem.weight }
        var newSkeleton = skeleton

        newSkeleton[switchedIndex] = switchedIndexValue

        return BackpackSolutionSkeleton(value: newValue, weight: newWeight, items: items.value, skeleton: newSkeleton)
    }
}
