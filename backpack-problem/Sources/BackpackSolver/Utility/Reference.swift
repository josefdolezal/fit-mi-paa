//
//  Reference.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 15/11/2017.
//

import Foundation

// Reference semantic for value types
// Allows value types to be passed as reference instead of shallow copy
class Reference<T> {
    var value: T

    init(initial value: T) {
        self.value = value
    }
}
