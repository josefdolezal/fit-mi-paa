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
        p cnf 6 3
        w 25 50 30
        1 -2 3 0
        2 4 5 0
        1 6 0
        """)

print(subject)

//subject.reduce(true) { $0 && $1.satisfiable() }

subject.first?.literals.first?.value = true

print(subject)
