//
//  TimeComplexityMeasurement.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 27/01/2018.
//

import Foundation

struct TimeComplexityMeasurement {
    // Measures time complexity of given closure. The result duration is in seconds.
    static func measure<T>(_ closure: () -> T) -> (duration: Double, value: T) {
        let start = clock()
        let value = closure()
        let end = clock()

        let ticsCount = end - start
        let duration = Double(ticsCount) / Double(EV_TICKS_PER_SEC)

        return (duration: duration, value: value)
    }
}
