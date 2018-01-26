//
//  main.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

let satInstances: [SATInstance]

do {
    satInstances = try CommandLine.arguments
        .suffix(from: 1)
        .flatMap(URL.init(string:))
        .map(FileLoader.loadFile(at:))
        .map(Parse.parse(input:))
} catch {
    print("An error occured while processing input files: \(error.localizedDescription)")
    print("Usage: <binary> INPUT_FILE [INPUT_FILE ...]")

    exit(1)
}

satInstances.forEach { instance in
    let solver = BruteForceSolver()

    print(solver.solve(instance: instance))
}
