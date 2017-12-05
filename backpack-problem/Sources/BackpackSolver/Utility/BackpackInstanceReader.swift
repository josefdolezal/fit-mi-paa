//
//  BackpackInstanceReader.swift
//  mi-paa-backpack-problem
//
//  Created by Josef Dolezal on 10/10/2017.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import Foundation

public enum BackpackInstanceReaderError: Error {
    case invalidData(String)
    case unsupportedFile(URL)
}

public protocol FileManagerType {
    func contentsOfDirectory(at: URL, includingPropertiesForKeys: [URLResourceKey]?, options: FileManager.DirectoryEnumerationOptions) throws -> [URL]
    func contents(atPath path: String) -> Data?
}

public protocol Readable {
    init(plainText: String) throws
}

public class FileContent<Content> {
    public let fileName: String
    public let content: Content

    init(fileName: String, content: Content) {
        self.fileName = fileName
        self.content = content
    }
}

public class BackpackInstanceReader {

    private let fileManager: FileManagerType

    public init(fileManager: FileManagerType) {
        self.fileManager = fileManager
    }

    public func readFiles<LineObject: Readable>(at folder: URL, ofType type: LineObject.Type, predicate: (URL) -> Bool = { _ in true }) throws -> [FileContent<[LineObject]>] {
        let fileManager = self.fileManager
        let files = try fileManager.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)

        return try files.filter(predicate).flatMap { try readFile(at: $0, ofType: type) }
    }

    public func readFile<LineObject: Readable>(at url: URL, ofType type: LineObject.Type) throws -> FileContent<[LineObject]>? {
        guard let fileData = fileManager.contents(atPath: url.path) else {
            throw BackpackInstanceReaderError.unsupportedFile(url)
        }

        let content = String(data: fileData, encoding: .utf8).flatMap { fileContent -> [LineObject]? in
            let lines = fileContent.components(separatedBy: "\n")

            return lines
                .filter { $0.count > 0 }
                .flatMap { try? type.init(plainText: $0) }
        }

        guard let fileContent = content else { return nil }

        return FileContent(fileName: url.lastPathComponent, content: fileContent)
    }
}
