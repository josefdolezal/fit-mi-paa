//
//  BackPackFittingStrategyTests.swift
//  mi-paa-backpack-problemTests
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest
@testable import BackpackSolver

class BackPackFittingStrategyTests: XCTestCase {

    var backpack: Backpack!
    var backpackItems: [BackpackItem]!

    override func setUp() {
        super.setUp()

        backpack = Backpack(maxWeight: 49)
        backpackItems = [(10, 15), (7, 11), (19, 2), (9, 3), (1, 20), (20, 1), (2, 4), (8, 8)]
            .map { BackpackItem(value: $0.1, weight: $0.0) }
    }

    func testAllCasesBackpackFittingStrategy() {
        let subject = backpack.fit(items: backpackItems, using: AllCasesBackpackFittingStrategy.self)

        XCTAssertEqual(subject.value, 61)
        XCTAssertEqual(subject.weight, 37)
    }

    func testBestRationFittingStrategy() {
        let subject = backpack.fit(items: backpackItems, using: BestRatioBackpackFittingStrategy.self)

        XCTAssertEqual(subject.value, 61)
        XCTAssertEqual(subject.weight, 37)
    }

}
