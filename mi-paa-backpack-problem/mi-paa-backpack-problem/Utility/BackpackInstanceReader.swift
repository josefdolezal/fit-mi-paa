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

class BackpackInstanceReader {

    private let fileManager: FileManagerType

    init(fileManager: FileManagerType) {
        self.fileManager = fileManager
    }

    func readInstances(at folder: URL) throws -> [[BackpackProblemInstance]] {
        let fileManager = self.fileManager
        let files = try fileManager.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)

        return try files.flatMap { fileURL in
            guard let fileData = fileManager.contents(atPath: fileURL.absoluteString) else {
                return nil
            }

            return String(data: fileData, encoding: .utf8)
        }.map { fileContent in
            let lines = fileContent.components(separatedBy: "\n")

            return try lines.flatMap { [weak self] line in try self?.createInstance(input: line) }
        }
    }

    private func createInstance(input: String) throws -> BackpackProblemInstance {
        let components = input.components(separatedBy: " ")
        let itemStartIndex = 3
        var items = [BackpackItem]()

        guard
            let id = components.first,
            let maxWeight = Int(components[2])
        else {
            throw BackpackInstanceReaderError.invalidData(input)
        }

        for i in stride(from: itemStartIndex, to: components.count, by: 2) {
            guard
                let weight = Int(components[i]),
                let value = Int(components[i+1])
            else {
                throw BackpackInstanceReaderError.invalidData(input)
            }

            items.append(BackpackItem(value: value, weight: weight))
        }

        return BackpackProblemInstance(id: id, backpackMaxWeight: maxWeight, backpackItems: items)
    }
}
