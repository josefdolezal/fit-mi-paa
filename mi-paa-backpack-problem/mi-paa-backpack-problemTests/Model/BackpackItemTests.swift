//
//  BackpackItemTests.swift
//  mi-paa-backpack-problemTests
//
//  Created by Josef Dolezal on 11/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest

class BackpackItemTests: XCTestCase {

    func testPropertiesAreInitializedCorrectly() {
        let subject = BackpackItem(value: 100, weight: 200)

        XCTAssertEqual(subject.value, 100)
        XCTAssertEqual(subject.weight, 200)
    }

    func testEqualOperator() {
        let subject = BackpackItem(value: 100, weight: 200)

        XCTAssertEqual(subject, BackpackItem(value: 100, weight: 200))
    }

    func testStringSerialization() {
        let subject = BackpackItem(value: 100, weight: 200)

        XCTAssertEqual("(100, 200)", subject.description)
    }
}
