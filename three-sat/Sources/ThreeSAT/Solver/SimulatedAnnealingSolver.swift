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
        var solution = generateSolution(for: instance)
        var bestSolution = solution
        var temperature = initialTemperature

        while temperature > SimulatedAnnealingSolver.minimalTemperature {
            for _ in 0...equilibrium {
                let nextConfiguration = self.nextConfiguration(for: instance, basedOn: solution)

                solution = compareSolutions(old: solution, new: nextConfiguration, at: temperature)

                if solution.satisfiable && solution.weight > bestSolution.weight {
                    bestSolution = solution
                }
            }

            temperature *= annealingFactor
        }

        return bestSolution.satisfiable ? bestSolution : nil
    }

    // MARK: Solution acceptance

    private func compareSolutions(old: SATSolution, new: SATSolution, at temperature: Double) -> SATSolution {
        let randomAcceptanceProbability = RandomService.nextNormalized()
        let acceptanceProbability = solutionAcceptanceProbability(old: old, new: new, at: temperature)

        if acceptanceProbability > randomAcceptanceProbability {
            return new
        }

        return old
    }

    private func solutionAcceptanceProbability(old: SATSolution, new: SATSolution, at temperature: Double) -> Double {
        let exponent = Double(old.weight - new.weight) / temperature

        return exp(exponent)
    }

    // MARK: - Neighbor configuration

    private func nextConfiguration(for instance: SATInstance, basedOn oldSolution: SATSolution) -> SATSolution {
        let updatedLiteralIndex = RandomService.next(withUpperBound: instance.literals.count)
        let newLiteralValue = !instance.literals[updatedLiteralIndex].value
        let weightAdditionMultiplier = newLiteralValue ? -1 : 1

        instance.literals[updatedLiteralIndex].value = newLiteralValue

        return SATSolution(weight: oldSolution.weight + weightAdditionMultiplier,
                           satisfiable: instance.satisfiable())
    }

    // MARK: - Initial solution

    // Try to randomly find solution
    // Not used since it is uneffecient
    private func randomSolution(for instance: SATInstance) -> SATSolution? {
        for _ in 0...10_000 {
            let solution = generateSolution(for: instance)

            if solution.satisfiable {
                return solution
            }
        }

        return nil
    }

    // Randomly set each literal to true/false
    private func generateSolution(for instance: SATInstance) -> SATSolution {
        instance.literals.forEach { literal in
            let literalIncluded = RandomService.nextBoolean()

            literal.value = literalIncluded
        }

        return instance.configrationValue()
    }
}
