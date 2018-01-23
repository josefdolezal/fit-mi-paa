//
//  BruteForceSolver.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 23/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

class BruteForceSolver: SATSolver {
    func solve(instance: SATInstance) -> SATSolution? {
        let numberOfLiterals = instance.literals.count
        let bitRepresentation = 1 << numberOfLiterals
        var solution: SATSolution?

        for iterator in 0..<bitRepresentation {
            for literal in 0..<numberOfLiterals {
                let included = iterator & (1 << literal) > 0

                instance.literals[literal].value = included
            }

            let newSolution = solve(valuatedInstance: instance)

            solution = compareSolutions(lhs: solution, rhs: newSolution)
        }

        return solution
    }

    private func solve(valuatedInstance instance: SATInstance) -> SATSolution {
        let satisfiable = instance.clauses.reduce(true) { $0 && $1.satisfiable() }
        let weight = instance.clauses
            .map { $0.valuatedWeight() }
            .reduce(0, +)

        return SATSolution(weight: satisfiable ? weight : 0, satisfiable: satisfiable)
    }

    private func compareSolutions(lhs: SATSolution?, rhs: SATSolution?) -> SATSolution? {
        guard let lhs = lhs else {
            return rhs
        }

        guard let rhs = rhs else {
            return lhs
        }

        return lhs.weight > rhs.weight ? lhs : rhs
    }
}
