//
//  FeedRepository.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

final class FeedRepository: FeedRepositoryProtocol {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func load() async throws -> Feed {
       return try await apiService.fetch(with: FeedRequestable.feed(page: 1))
    }
    
    func loadNext(with page: Int) async throws -> Feed {
        return try await apiService.fetch(with: FeedRequestable.feed(page: page))
    }
}
