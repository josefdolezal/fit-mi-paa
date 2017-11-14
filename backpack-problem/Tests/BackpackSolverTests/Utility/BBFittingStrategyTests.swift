//
//  BBFittingStrategyTests.swift
//  BackpackSolverTests
//
//  Created by Josef Dolezal on 14/11/2017.
//

import XCTest
@testable import BackpackSolver

class BBFittingStrategyTests: XCTestCase {
    
    func testReference() {
        let reference = Reference(initial: 0)
        let referenceCopy = reference

        reference.value = 1
        XCTAssertEqual(referenceCopy.value, 1)

        referenceCopy.value = 2
        XCTAssertEqual(reference.value, 2)
    }
}
