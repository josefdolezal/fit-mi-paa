//
//  BackpackProblemSolution.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 11/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

struct BackpackProblemSolution {
    let id: String
    let backpackValue: Int
}

extension BackpackProblemSolution: Readable {
    init(plainText: String) throws {
        let components = plainText.components(separatedBy: " ")

        guard
            let id = components.first,
            let backpackValue = Int(components[2])
        else {
            throw BackpackInstanceReaderError.invalidData(plainText)
        }

        self.init(id: id, backpackValue: backpackValue)
    }
}
