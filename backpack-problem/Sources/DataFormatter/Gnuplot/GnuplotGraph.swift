//
//  GnuplotGraph.swift
//  DataFormatter
//
//  Created by Josef Dolezal on 15/10/2017.
//

import Foundation

public protocol GraphRenderable {
    func rended(with separator: String) -> String
}

public class GnuplotGraph {
    let headings: Headings

    private enum Separators {
        static let rowSeparator = "\n"
        static let columnSeparator = "\t"
    }

    public init(headings: Headings) {
        self.headings = headings
    }

    public func render(with values: [Value]) -> String {
        let rows: [GraphRenderable] = [headings] + values

        return rows
            .map { $0.rended(with: Separators.columnSeparator) }
            .joined(separator: Separators.rowSeparator)
    }
}
