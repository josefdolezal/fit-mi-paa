//
//  Array+OperatorsTests.swift
//  mi-paa-backpack-problemTests
//
//  Created by Josef Dolezal on 10/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest

class Array_OperatorsTests: XCTestCase {

    func testReduceWhileWorksWithEmptyArray() {
        let subject = [Int]()

        XCTAssertEqual(subject, subject.reduce([], while: { _, _ in true }, { $0 + [$1] }))
        XCTAssertEqual(subject, subject.reduce([], while: { _, _ in false }, { $0 + [$1] }))
    }

    func testReduceWhileStopsOnFalse() {
        let subject = Array(repeating: 0, count: 10)

        XCTAssertEqual(5, subject.reduce(0, while: { partial, _ in partial < 5 }, { partial, _ in partial + 1 }))
    }
}
