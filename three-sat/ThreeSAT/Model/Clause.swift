//
//  Clause.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

class Clause {
    let literals: [Literal]

    init(literals: [Literal]) {
        self.literals = literals
    }

    func satisfiable() -> Bool {
        return literals.reduce(false) { $0 || $1.value }
    }
}
