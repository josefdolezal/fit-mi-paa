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
