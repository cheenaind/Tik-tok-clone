//
//  FIleApiManager.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

import Foundation

final class FileApiManager {
    let apiService: APIServiceProtocol
    
    static let shared = FileApiManager()
    
    private init() {
        let fileManager = JsonFileManager()
        let decoder = NetworkResponseDecoder()
        let fileNetworkService = FileNetworkService(fileManager: fileManager)
        let fileApiService = FileAPIService(networkService: fileNetworkService, decoder: decoder)
        self.apiService = fileApiService
    }
}
