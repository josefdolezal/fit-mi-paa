//
//  Sequence+Average.swift
//  three-satPackageDescription
//
//  Created by Josef Dolezal on 28/01/2018.
//

import Foundation

extension Array where Element == Double {
    func average() -> Element? {
        guard count > 0 else { return nil }

        return reduce(0, +) / Double(count)
    }
}
