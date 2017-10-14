//
//  Array+PermutationsTests.swift
//  mi-paa-backpack-problemTests
//
//  Created by Josef Dolezal on 08/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest
import Foundation
@testable import BackpackSolver

class Array_PermutationsTests: XCTestCase {

    func testGeneratesAllPermutations() {
        let subject = [1, 2, 3, 4].subsets
        let reference = [
            [], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3], [4], [1, 4],
            [2, 4], [1, 2, 4], [3, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]
        ]

        XCTAssertEqual(subject.count, reference.count)
        XCTAssertTrue(subject.elementsEqual(reference) { $0 == $1 } )
    }

    func testDoesNotFailForEmptySet() {
        let subject = [Int]().subsets
        let reference: [[Int]] = [[]]

        XCTAssertEqual(subject.count, reference.count)
        XCTAssertTrue(subject.elementsEqual(reference) { $0 == $1 })
    }
}


