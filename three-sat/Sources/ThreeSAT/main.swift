//
//  main.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Commander

let main = Group {
    $0.addCommand("time", timeComplexityCommand)
    $0.addCommand("accuracy", solutionAccuracyCommand)
}

main.run()
