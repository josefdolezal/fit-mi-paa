//
//  SimulatedAnnealingSolver.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 24/01/2018.
//

import Foundation

class SimulatedAnnealingSolver: SATSolver {

    private let initialTemperature: Double
    private let annealingFactor: Double
    private let equilibrium: Int

    private static let minimalTemperature = 1.0

    // MARK: Public API

    init(initialTemperature: Double, annealingFactor: Double, equilibrium: Int) {
        self.initialTemperature = initialTemperature
        self.annealingFactor = annealingFactor
        self.equilibrium = equilibrium
    }

    func solve(instance: SATInstance) -> SATSolution? {
        guard let initialSolution = randomSolution(for: instance) else {
            return nil
        }

        var solution = initialSolution
        var temperature = initialTemperature

        while temperature > SimulatedAnnealingSolver.minimalTemperature {
            for _ in 0...equilibrium {
                let nextConfiguration = self.nextConfiguration(for: instance)

                solution = compareSolutions(old: solution, new: nextConfiguration, at: temperature)
            }

            temperature *= annealingFactor
        }

        return solution
    }

    // MARK: Solution acceptance

    private func compareSolutions(old: SATSolution, new: SATSolution, at temperature: Double) -> SATSolution {
        let randomAcceptanceProbability = RandomService.nextNormalized()

        if solutionAcceptanceProbability(old: old, new: new, at: temperature) > randomAcceptanceProbability {
            return new
        }

        return old
    }

    private func solutionAcceptanceProbability(old: SATSolution, new: SATSolution, at temperature: Double) -> Double {
        let exponent = Double(old.weight - new.weight) / temperature

        return exp(exponent)
    }

    // MARK: - Neighbor configuration

    private func nextConfiguration(for instance: SATInstance) -> SATSolution {
        let updatedLiteralIndex = RandomService.next(withUpperBound: instance.literals.count)
        let literalValue = instance.literals[updatedLiteralIndex].value

        instance.literals[updatedLiteralIndex].value = !literalValue

        return instance.configrationValue()
    }

    // MARK: - Initial solution

    // Try to randomly find solution
    private func randomSolution(for instance: SATInstance) -> SATSolution? {
        for _ in 0...10_000 {
            if let solution = generateSolution(for: instance) {
                return solution
            }
        }

        return nil
    }

    // Randomly set each literal to true/false
    private func generateSolution(for instance: SATInstance) -> SATSolution? {
        instance.literals.forEach { literal in
            let literalIncluded = RandomService.nextBoolean()

            literal.value = literalIncluded
        }

        return instance.solution()
    }
}
