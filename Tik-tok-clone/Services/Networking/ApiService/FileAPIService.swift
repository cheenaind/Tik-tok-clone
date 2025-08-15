//
//  FileAPIService.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

import Foundation

final class FileAPIService: APIServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private let decoder: JSONDecoder
    
    init(networkService: NetworkServiceProtocol, decoder: JSONDecoder) {
        self.networkService = networkService
        self.decoder = decoder
    }
    
    func fetch<T>(with requestable: any Requestable) async throws -> T where T : Decodable {
        let data = try await networkService.makeRequest(with: requestable)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw error
        }
    }
}
