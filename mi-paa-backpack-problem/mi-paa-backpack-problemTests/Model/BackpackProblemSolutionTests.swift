//
//  BackpackProblemSolutionTests.swift
//  mi-paa-backpack-problemTests
//
//  Created by Josef Dolezal on 11/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest

class BackpackProblemSolutionTests: XCTestCase {

    func testPropertiesAreInitializedCorrectly() {
        let subject = BackpackProblemSolution(id: "01", backpackWeight: 100)

        XCTAssertEqual(subject.id, "01")
        XCTAssertEqual(subject.backpackWeight, 100)
    }

    func testPlainTextParsing() {
        let subject = try! BackpackProblemSolution(plainText: "9000 4 473  1 1 0 1")

        XCTAssertEqual(subject.id, "9000")
        XCTAssertEqual(subject.backpackWeight, 473)
    }
}
