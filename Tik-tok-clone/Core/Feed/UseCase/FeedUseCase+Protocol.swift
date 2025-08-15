//
//  FeedUseCase.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

protocol FeedUseCaseProtocol {
    func loadFeedItems() async throws -> [FeedItem]
    func loadNextFeedItems() async throws -> [FeedItem]
}

final class FeedUseCase: FeedUseCaseProtocol {
    private let repository: FeedRepositoryProtocol
    private var page: Int = 1
    private var nextPage: String?
    
    init(repository: FeedRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadFeedItems() async throws -> [FeedItem] {
        let feed = try await repository.load()
        nextPage = feed.nextPageUrl
        return feed.items
    }
    
    func loadNextFeedItems() async throws -> [FeedItem] {
        page += 1
        
        if nextPage == nil {
            return []
        } else {
            let feed = try await repository.loadNext(with: page)
            nextPage = feed.nextPageUrl
            return feed.items
        }
    }
}
