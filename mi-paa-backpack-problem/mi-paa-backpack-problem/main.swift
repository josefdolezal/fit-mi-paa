//
//  main.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

let filesReader = BackpackInstanceReader(fileManager: FileManager.default)

let instances = try! filesReader.readFiles(at: URL(string: "./Input")!, ofType: BackpackProblemInstance.self)
let solutions = try! filesReader.readFiles(at: URL(string: "Output")!, ofType: BackpackProblemSolution.self)
