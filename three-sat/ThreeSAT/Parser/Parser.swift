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
    }

    static func parse(input: String) -> [Clause] {
        let clauses = input.components(separatedBy: Format.clauseSeparator)
        var context = Context()

        return clauses.map { clause in
            return parseClause(input: clause, with: &context)
        }
    }

    private static func parseClause(input: String, with context: inout Context) -> Clause {
        let literals = input
            .components(separatedBy: Format.formulaSeparator)
            .flatMap { literal in
                return lookup(literal: literal, in: &context)
            }

        return Clause(literals: literals)
    }

    private static func lookup(literal: String, in context: inout Context) -> Literal? {
        guard let value = Int(literal) else { return nil }
        let key = String(value)
        let formula = context[key] ?? Formula(value: false)

        context[key] = formula

        return value < 0 ? Not(formula: formula) : formula
    }
}
