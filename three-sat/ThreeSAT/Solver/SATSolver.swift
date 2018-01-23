//
//  SATSolver.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 23/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

protocol SATSolver {
    func solve(instance: SATInstance) -> SATSolution?
}
