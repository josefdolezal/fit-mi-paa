//
//  Array+Operators.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 10/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

extension Array {
    func reduce<Result>(_ initialResult: Result, while shouldReduce: (Result, Element) -> Bool,
                        _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {

        var reduceFlag = true

        return try reduce(initialResult) { partial, element in
            guard reduceFlag, shouldReduce(partial, element) else {
                reduceFlag = false
                return partial
            }

            return try nextPartialResult(partial, element)
        }
    }
}

extension Array where Element: FloatingPoint {
    func average() -> Element? {
        guard count > 0 else { return nil }

        return reduce(0, +) / Element(count)
    }
}
