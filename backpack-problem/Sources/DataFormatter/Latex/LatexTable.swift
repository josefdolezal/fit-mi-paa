//
//  LatexTable.swift
//  BackpackBenchmark
//
//  Created by Josef Dolezal on 22/10/2017.
//

import Foundation

public class LatexTable {

    private enum Separator: String {
        case line = " \\\n"
        case column = " & "
    }

    private let headings: [String]

    public init(headings: [String]) {
        self.headings = headings
    }

    public func render(with rows: [LatexRow]) -> String {
        let contentRows = rows.map { row in
            row.columns
                .prefix(headings.count)
                .joined(separator: Separator.column.rawValue)
        }

        let headerRow = headings.joined(separator: Separator.column.rawValue)

        return ([headerRow] + contentRows).joined(separator: Separator.line.rawValue)
    }
}
