//
//  Literal.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

protocol Literal: class, CustomStringConvertible {
    var value: Bool { get set }
    var weight: Int { get }
}

class Formula: Literal {
    var value: Bool

    let weight: Int

    var description: String { return "Literal(\(value))" }

    init(value: Bool, weight: Int) {
        self.value = value
        self.weight = weight
    }
}

class Not: Literal {

    var value: Bool {
        get {
            return !formula.value
        } set {
            formula.value = !newValue
        }
    }

    var weight: Int { return formula.weight }

    let formula: Formula

    var description: String { return "Not(\(formula))" }

    init(formula: Formula) {
        self.formula = formula
    }
}
