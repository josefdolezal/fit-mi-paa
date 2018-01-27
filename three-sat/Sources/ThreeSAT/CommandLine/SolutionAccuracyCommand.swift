//
//  SolutionAccuracyCommand.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 27/01/2018.
//

import Foundation
import Commander

let solutionAccuracyCommand = command(
    Argument<Double>("initial temperature", description: "initial temperature of simulated annealing"),
    Argument<Double>("annealing factor", description: "temperature annealing factor"),
    Argument<Int>("equilibrium", description: "size of inner loop"),
    VariadicArgument<String>("input files", description: "DIMACS format input files"),
    measureTimeComplexity)

fileprivate func measureTimeComplexity(initialTemperature: Double, annealingFactor: Double, equilibrium: Int, inputs: [String]) throws {
    let solver = SimulatedAnnealingSolver(initialTemperature: initialTemperature, annealingFactor: annealingFactor, equilibrium: equilibrium)
    let satInstances = try inputs
        .flatMap(URL.init(string:))
        .map(FileLoader.loadFile(at:))
        .map(Parse.parse(input:))

    let durations = satInstances.map { instance in
        TimeComplexityMeasurement.measure {
            return solver.solve(instance: instance)
        }
    }

    print(durations)
}
