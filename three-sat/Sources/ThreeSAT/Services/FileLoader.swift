//
//  FileLoader.swift
//  ThreeSAT
//
//  Created by Josef Dolezal on 25/01/2018.
//

import Foundation

enum FileLoaderError: Error {
    case couldNotLoadFile(underlying: Error)
    case unsupportedFileFormat
}

class FileLoader {
    static func loadFile(at location: URL) throws -> String {
        let fileData: Data

        do {
            fileData = try Data(contentsOf: location)
        } catch {
            throw FileLoaderError.couldNotLoadFile(underlying: error)
        }

        guard let fileContent = String(data: fileData, encoding: .utf8) else {
            throw FileLoaderError.unsupportedFileFormat
        }

        return fileContent
    }
}
