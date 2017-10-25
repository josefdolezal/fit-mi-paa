//
//  Value.swift
//  DataFormatter
//
//  Created by Josef Dolezal on 15/10/2017.
//

import Foundation

public struct Value {
    public let x: String
    public let y: String

    public init(x: String, y: String) {
        self.x = x
        self.y = y
    }
}

extension Value: GraphRenderable {
    public func rended(with separator: String) -> String {
        return [x, y].joined(separator: separator)
    }
}
