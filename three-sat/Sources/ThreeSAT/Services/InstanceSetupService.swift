//
//  InstanceSetupService.swift
//  three-satPackageDescription
//
//  Created by Josef Dolezal on 28/01/2018.
//

import Foundation

struct InstanceSetupService {
    static func setup(fromFiles filePaths: [String]) throws -> [SATInstance] {
        return try filePaths
            .flatMap(URL.init(fileURLWithPath:))
            .map(FileLoader.loadFile(at:))
            .map(Parser.parse(input:))
    }
}
