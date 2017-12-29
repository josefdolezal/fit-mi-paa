//
//  SimulatedAnnealingFittingStrategy.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 27/12/2017.
//

import Foundation

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
}
