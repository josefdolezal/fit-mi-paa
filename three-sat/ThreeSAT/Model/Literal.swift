//
//  Literal.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 22/01/2018.
//  Copyright © 2018 Josef Dolezal. All rights reserved.
//

import Foundation

protocol Literal {
    var value: Bool { get set }
}

class Formula: Literal {
    var value: Bool

    init(value: Bool) {
        self.value = value
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

    let formula: Formula

    init(formula: Formula) {
        self.formula = formula
    }
}
