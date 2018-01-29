//
//  SATInstance.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 23/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

class SATInstance {
    let clauses: [Clause]
    let literals: [Literal]

    init(clauses: [Clause], literals: [Literal]) {
        self.clauses = clauses
        self.literals = literals
    }

    func satisfiable() -> Bool {
        return clauses.reduce(true) { $0 && $1.satisfiable() }
    }

    func solution() -> SATSolution? {
        let configurationValue = configrationValue()

        return configurationValue.satisfiable ? configurationValue : nil
    }

    func configrationValue() -> SATSolution {
        let satisfiable = self.satisfiable()
        let weight = clauses.reduce(0) { $0 + $1.valuatedWeight() }

        return SATSolution(weight: weight, satisfiable: satisfiable)
    }
}
