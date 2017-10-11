//
//  BackpackItem.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

class BackpackItem {
    let value: Int
    let weight: Int

    init(value: Int, weight: Int) {
        self.value = value
        self.weight = weight
    }
}

extension BackpackItem: Equatable {
    static func ==(lhs: BackpackItem, rhs: BackpackItem) -> Bool {
        return lhs.value == rhs.value && lhs.weight == rhs.weight
    }
}

extension BackpackItem: CustomStringConvertible {
    var description: String {
        return "(\(value), \(weight))"
    }
}
