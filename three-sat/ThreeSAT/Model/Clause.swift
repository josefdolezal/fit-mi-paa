//
//  Clause.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

class Clause: CustomStringConvertible {
    let literals: [Literal]

    var description: String { return literals.description }

    init(literals: [Literal]) {
        self.literals = literals
    }

    func satisfiable() -> Bool {
        return literals.reduce(false) { $0 || $1.value }
    }

    func valuatedWeight() -> Int {
        return literals.reduce(0) { partial, literal in
            return partial + literal.valuatedWeight
        }
    }
}
