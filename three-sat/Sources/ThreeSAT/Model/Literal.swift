//
//  Literal.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

extension Bool {
    func map<T>(_ transform: (Bool) -> T) -> T {
        return transform(self)
    }
}

protocol Literal: class, CustomStringConvertible {
    var value: Bool { get set }
    var weight: Int { get }
    var valuatedWeight: Int { get }
    var additionWeight: Int { get }
}

class Formula: Literal {
    var value: Bool

    let weight: Int

    var valuatedWeight: Int { return value ? weight : 0 }

    var additionWeight: Int { return value ? weight : -weight }

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

    var valuatedWeight: Int { return 0 }

    var additionWeight: Int { return value ? -weight : weight }

    let formula: Formula

    var description: String { return "Not(\(formula))" }

    init(formula: Formula) {
        self.formula = formula
    }
}
