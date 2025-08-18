//
//  FileAPIService.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

import Foundation

final class FileAPIService: APIServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private let decoder: ResponseDecoderProtocol
    
    init(networkService: NetworkServiceProtocol, decoder: ResponseDecoderProtocol) {
        self.networkService = networkService
        self.decoder = decoder
    }
    
    func fetch<T>(with requestable: any Requestable) async throws -> T where T : Decodable {
        let data = try await networkService.makeRequest(with: requestable)
        return try await decoder.decode(data)
    }
}
