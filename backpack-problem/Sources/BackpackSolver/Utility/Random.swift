//
//  Random.swift
//  BackpackSolver
//
//  Created by Josef Dolezal on 29/12/2017.
//

import Foundation

struct Random {
    static func withUpperBound(_ upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }

    static func normalized() -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF)
    }

    static func boolean() -> Bool {
        return arc4random() % 2 == 1
    }
}
