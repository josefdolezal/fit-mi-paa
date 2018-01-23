//
//  main.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

let subject = Parse.parse(input: """
        c This is a comment
        c This is another comment
        p cnf 3 1
        w 25 50 30
        1 2 3
        """)


let solver = BruteForceSolver()
