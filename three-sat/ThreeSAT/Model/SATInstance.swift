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
}
