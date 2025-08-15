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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        let fileNetworkService = FileNetworkService(fileManager: fileManager)
        let fileApiService = FileAPIService(networkService: fileNetworkService, decoder: decoder)
        self.apiService = fileApiService
    }
}
