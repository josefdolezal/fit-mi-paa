//
//  Headings.swift
//  DataFormatter
//
//  Created by Josef Dolezal on 15/10/2017.
//

import Foundation

public struct Headings {
    public let x: String
    public let y: String

    private enum Marks {
        static let commentMark = "# "
    }

    public init(x: String, y: String) {
        self.x = x
        self.y = y
    }
}

extension Headings: GraphRenderable {
    public func rended(with separator: String) -> String {
        return [Marks.commentMark, x, y].joined(separator: separator)
    }
}
