//
//  BackpackInstanceReader.swift
//  mi-paa-backpack-problemTests
//
//  Created by Josef Dolezal on 11/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest

class BackpackInstanceReaderTests: XCTestCase {

    var subject: BackpackInstanceReader!

    let instances: [[BackpackInstanceReader.BackpackProblemInstance]] = [
        [(100, [.init(value: 114, weight: 18), .init(value: 136, weight: 42), .init(value: 192, weight: 88), .init(value: 223, weight: 3)])],
        [(100, [.init(value: 29, weight: 55), .init(value: 64, weight: 81), .init(value: 104, weight: 14), .init(value: 222, weight: 52)])],
        [(100, [.init(value: 196, weight: 89), .init(value: 62, weight: 18), .init(value: 34, weight: 57), .init(value: 112, weight: 69)])],
        [(100, [.init(value: 169, weight: 34), .init(value: 152, weight: 23), .init(value: 44, weight: 62), .init(value: 224, weight: 2)])],
    ]

    override func setUp() {
        super.setUp()

        subject = BackpackInstanceReader(fileManager: FileManagerMock())
    }

    func testAllInstancesAreReadProperly() {
        let instances = try! subject.readInstances(at: URL(string: "/")!)

        XCTAssertEqual(self.instances.count, instances.count)

        // Test all files
        for iterator in 0..<self.instances.count {
            for index in 0..<self.instances[iterator].count {
                let reference = self.instances[iterator][index]
                let instance = instances[iterator][index]

                XCTAssertEqual(reference.maxWeight, instance.maxWeight)
                XCTAssertEqual(reference.items, instance.items)
            }
        }
    }
}

class FileManagerMock: FileManagerType {
    let files = [
        "9000 4 100 18 114 42 136 88 192 3 223",
        "9001 4 100 55 29 81 64 14 104 52 222",
        "9002 4 100 89 196 18 62 57 34 69 112",
        "9003 4 100 34 169 23 152 62 44 2 224"
    ]

    func contentsOfDirectory(at: URL, includingPropertiesForKeys: [URLResourceKey]?, options: FileManager.DirectoryEnumerationOptions) throws -> [URL] {
        return (0..<files.count).map { URL(string: "\($0)")! }
    }

    func contents(atPath path: String) -> Data? {
        guard
            let index = Int(path)
        else {
            return nil
        }

        return files[index].data(using: .utf8)
    }
}