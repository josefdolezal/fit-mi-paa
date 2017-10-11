//
//  BackpackInstanceReader.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 10/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

enum BackpackInstanceReaderError: Error {
    case invalidData(String)
}

protocol FileManagerType {
    func contentsOfDirectory(at: URL, includingPropertiesForKeys: [URLResourceKey]?, options: FileManager.DirectoryEnumerationOptions) throws -> [URL]
    func contents(atPath path: String) -> Data?
}

protocol Readable {
    init(plainText: String) throws
}

class BackpackInstanceReader {

    private let fileManager: FileManagerType

    init(fileManager: FileManagerType) {
        self.fileManager = fileManager
    }

    func readFiles<LineObject: Readable>(at folder: URL, ofType type: LineObject.Type) throws -> [[LineObject]] {
        let fileManager = self.fileManager
        let files = try fileManager.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)

        return files.flatMap { fileURL in
            guard let fileData = fileManager.contents(atPath: fileURL.path) else {
                return nil
            }

            return String(data: fileData, encoding: .utf8)
        }.map { fileContent in
            let lines = fileContent.components(separatedBy: "\n")

            return lines
                .filter { $0.characters.count > 0 }
                .flatMap { try? type.init(plainText: $0) }
        }
    }
}
