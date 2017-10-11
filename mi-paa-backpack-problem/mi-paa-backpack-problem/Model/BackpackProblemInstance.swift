//
//  BackpackProblemInstance.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 11/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct BackpackProblemInstance {
    let id: String
    let backpackMaxWeight: Int
    let backpackItems: [BackpackItem]

    init(id: String, backpackMaxWeight: Int, backpackItems: [BackpackItem]) {
        self.id = id
        self.backpackMaxWeight = backpackMaxWeight
        self.backpackItems = backpackItems
    }
}

extension BackpackProblemInstance: Equatable {
    static func ==(lhs: BackpackProblemInstance, rhs: BackpackProblemInstance) -> Bool {
        return lhs.id == rhs.id && lhs.backpackMaxWeight == rhs.backpackMaxWeight && lhs.backpackItems == rhs.backpackItems
    }
}

extension BackpackProblemInstance: Readable {
    init(plainText: String) throws {
        let components = plainText.components(separatedBy: " ")
        let itemStartIndex = 3
        var items = [BackpackItem]()

        guard
            let id = components.first,
            let maxWeight = Int(components[2])
        else {
            throw BackpackInstanceReaderError.invalidData(plainText)
        }

        for i in stride(from: itemStartIndex, to: components.count, by: 2) {
            guard
                let weight = Int(components[i]),
                let value = Int(components[i+1])
            else {
                throw BackpackInstanceReaderError.invalidData(plainText)
            }

            items.append(BackpackItem(value: value, weight: weight))
        }

        self.init(id: id, backpackMaxWeight: maxWeight, backpackItems: items)

    }
}
