//
//  Backpack.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

public class Backpack {
    public let maxWeight: Int

    public init(maxWeight: Int) {
        self.maxWeight = maxWeight
    }

    public func fit(items: [BackpackItem], using strategyType: BackpackFittingStrategyType.Type) -> BackpackFittingResult {
        return strategyType.fit(items: items, maxWeight: maxWeight) ?? (0, 0)
    }
}
