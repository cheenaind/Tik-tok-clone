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
        let fileNetworkService = FileNetworkService(fileManager: fileManager)
        let fileApiService = FileAPIService(networkService: fileNetworkService, decoder: JSONDecoder())
        self.apiService = fileApiService
    }
}
