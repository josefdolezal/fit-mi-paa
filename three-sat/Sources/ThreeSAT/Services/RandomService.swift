//
//  RandomService.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 24/01/2018.
//

import Foundation

class RandomService {
    static func next(withUpperBound upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }

    static func nextBoolean() -> Bool {
        return arc4random() & 1 == 1
    }

    // Returns next random number between 0 and 1
    static func nextNormalized() -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF)
    }
}
