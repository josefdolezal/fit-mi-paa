//
//  Array+Permutations.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

extension Array {
    var subsets: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).subsets.flatMap { [$0, [self[0]] + $0] }
    }
}
