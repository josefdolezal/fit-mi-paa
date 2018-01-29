//
//  TimeComplexityMeasurement.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 27/01/2018.
//

import Foundation

struct TimeComplexityMeasurement {
    typealias Duration<T> = (duration: Double, value: T)

    // Measures time complexity of given closure. The result duration is in seconds.
    static func measure<T>(_ closure: () -> T) -> Duration<T> {
        let start = clock()
        let value = closure()
        let end = clock()

        let ticsCount = end - start
        let duration = Double(ticsCount) / Double(CLOCKS_PER_SEC)

        return (duration: duration, value: value)
    }

    static func averageDuration<T>(of durations: [Duration<T>]) -> Double? {
        return durations
            .map { $0.duration }
            .average()
    }
}
