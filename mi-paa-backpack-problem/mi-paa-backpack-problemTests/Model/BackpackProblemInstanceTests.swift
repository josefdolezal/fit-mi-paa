//
//  BackpackProblemInstanceTests.swift
//  mi-paa-backpack-problemTests
//
//  Created by Josef Dolezal on 11/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest

class BackpackProblemInstanceTests: XCTestCase {

    func testPropertiesAreInitializedCorrectly() {
        let subject = BackpackProblemInstance(id: "", backpackMaxWeight: 100, backpackItems: [])

        XCTAssertEqual(subject.id, "")
        XCTAssertEqual(subject.backpackMaxWeight, 100)
        XCTAssertEqual(subject.backpackItems, [])
    }

    func testEqualOperator() {
        let subject = BackpackProblemInstance(id: "", backpackMaxWeight: 100, backpackItems: [])

        XCTAssertEqual(subject, BackpackProblemInstance(id: "", backpackMaxWeight: 100, backpackItems: []))
    }

    func testPlainTextParsing() {
        let subject = try! BackpackProblemInstance(plainText: "9000 4 100 18 114")

        XCTAssertEqual(subject, BackpackProblemInstance.init(id: "9000", backpackMaxWeight: 100, backpackItems: [BackpackItem(value: 114, weight: 18)]))
    }
}
