//
//  JsonFileManager.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

import Foundation

enum FileManagerError: Error {
    case fileNotFound
}

final class JsonFileManager: FileManagerProtocol {
    internal var fileExtension: FileExtension { .json }
    
    func read(from requestable: any Requestable) async throws -> Data {
        guard let url = Bundle.main.url(forResource: requestable.url, withExtension: requestable.path) else {
            throw FileManagerError.fileNotFound
        }
        return try Data(contentsOf: url)
    }
}
