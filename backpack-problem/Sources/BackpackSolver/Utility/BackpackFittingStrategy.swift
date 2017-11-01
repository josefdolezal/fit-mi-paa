//
//  BackpackFittingStrategy.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

public typealias BackpackFittingResult = (weight: Int, value: Int)

public protocol BackpackFittingStrategyType {
    static func fit(items: [BackpackItem], maxWeight: Int) -> BackpackFittingResult?
}
