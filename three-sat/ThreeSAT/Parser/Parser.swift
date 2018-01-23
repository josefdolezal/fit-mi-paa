//
//  Parser.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

class Parse {

    private typealias Context = [String: Formula]

    private struct Format {
        static let clauseSeparator = "0"
        static let formulaSeparator = " "
        static let newLineSeparator = "\n"
        static let commentPrefix = "c"
    }

    static func parse(input: String) -> SATInstance {
        var context = Context()
        let clearedString = readVariableWeights(from: readProblem(from: removeComments(from: input)), context: &context)
        let clausesString = clearedString
            .components(separatedBy: Format.clauseSeparator)

        let clauses = clausesString.map { clause in
            return parseClause(input: clause, with: &context)
        }
        let literals = Array(context.values)

        return SATInstance(clauses: clauses, literals: literals)
    }

    private static func parseClause(input: String, with context: inout Context) -> Clause {
        let literals = input
            .components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .flatMap { literal in
                return lookup(literal: literal, in: &context)
            }

        return Clause(literals: literals)
    }

    private static func lookup(literal: String, in context: inout Context) -> Literal? {
        guard
            let value = Int(literal),
            let formula = context[String(abs(value))]
        else { return nil }

        return value < 0 ? Not(formula: formula) : formula
    }

    private static func removeComments(from input: String) -> String {
        return input
            .components(separatedBy: Format.newLineSeparator)
            .filter { !$0.hasPrefix(Format.commentPrefix) }
            .joined(separator: Format.newLineSeparator)
    }

    private static func removeLine(from string: String) -> String {
        if let index = string.index(of: Character(Format.newLineSeparator)) {
            return String(string.substring(from: string.index(after: index)))
        }

        return string
    }

    private static func readProblem(from input: String) -> String {
        return removeLine(from: input)
    }

    private static func readVariableWeights(from input: String, context: inout Context) -> String {
        input.components(separatedBy: Format.formulaSeparator)
            .flatMap(Int.init)
            .enumerated()
            .forEach { offset, weight in
                context[String(offset + 1)] = Formula(value: false, weight: weight)
            }

        return removeLine(from: input)
    }
}
