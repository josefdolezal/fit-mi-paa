//
//  Bool+Map.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 29/12/2017.
//

import Foundation

extension Bool {
    func map<T>(_ transform: (Bool) -> T) -> T {
        return transform(self)
    }
}
