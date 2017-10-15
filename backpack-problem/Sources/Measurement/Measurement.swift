//
//  Measurement.swift
//  BackpackProblem
//
//  Created by Josef Dolezal on 15/10/2017.
//

import Foundation

public typealias Duration = Double

public func measure(_ block: () -> Void) -> Duration {
    let start = clock()

    block()

    return Double(clock() - start) / Double(CLOCKS_PER_SEC)
}

public func measure<T>(_ block: () -> T) -> (duration: Duration, result: T) {
    let start = clock()
    let result = block()
    let duration = Double(clock() - start) / Double(CLOCKS_PER_SEC)

    return (duration, result)
}
