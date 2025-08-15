//
//  FeedViewModel.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var posts = [FeedItem]() {
        didSet {
            postById = Dictionary(uniqueKeysWithValues: posts.map { ($0.id, $0) })
        }
    }
    
    private(set) var postById: [String: FeedItem] = [:]
    private let useCase: FeedUseCase
    
    init() {
        self.useCase = FeedUseCase(repository: FeedRepository(apiService: FileApiManager.shared.apiService))
    }
    
    func initialLoad() {
        Task {
            do {
                await setLoading(to: true)
                let feed = try await useCase.loadFeedItems()
                
                await MainActor.run { [weak self] in
                    self?.posts = feed
                }
                await setLoading(to: false)
            } catch {
                await setLoading(to: false)
            }
        }
    }
    
    func loadNext() {
        Task {
            do {
                await setLoading(to: true)
                let feed = try await useCase.loadNextFeedItems()
                
                await MainActor.run { [weak self] in
                    self?.posts.append(contentsOf: feed)
                }
                await setLoading(to: false)
            } catch {
                await setLoading(to: false)
            }
        }
    }
    
    @MainActor
    func setLoading(to loading: Bool) {
        isLoading = loading
    }
}
