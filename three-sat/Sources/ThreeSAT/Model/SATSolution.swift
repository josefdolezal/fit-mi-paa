//
//  SATSolution.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 23/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

class SATSolution: CustomStringConvertible {
    let weight: Int
    let satisfiable: Bool

    var description: String {
        return "SATSolution(weight: \(weight), satifiable: \(satisfiable))"
    }

    init(weight: Int, satisfiable: Bool) {
        self.weight = weight
        self.satisfiable = satisfiable
    }
}
