//
//  FileNetworkService.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

import Foundation

protocol FileRequestable: Requestable {}

final class FileNetworkService: NetworkServiceProtocol {
    private let fileManager: FileManagerProtocol
    
    init(fileManager: FileManagerProtocol) {
        self.fileManager = fileManager
    }
    
    func makeRequest(with requestable: any Requestable) async throws -> Data {
        return try await fileManager.read(from: requestable)
    }
}
