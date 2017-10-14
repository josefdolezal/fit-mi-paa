//
//  BackpackItem.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

public class BackpackItem {
    public let value: Int
    public let weight: Int

    public init(value: Int, weight: Int) {
        self.value = value
        self.weight = weight
    }
}

extension BackpackItem: Equatable {
    public static func ==(lhs: BackpackItem, rhs: BackpackItem) -> Bool {
        return lhs.value == rhs.value && lhs.weight == rhs.weight
    }
}

extension BackpackItem: CustomStringConvertible {
    public var description: String {
        return "(\(value), \(weight))"
    }
}
