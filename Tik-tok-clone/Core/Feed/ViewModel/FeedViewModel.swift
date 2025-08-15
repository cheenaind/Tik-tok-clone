//
//  FeedViewModel.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [FeedItem]() {
        didSet {
            postById = Dictionary(uniqueKeysWithValues: posts.map { ($0.id, $0) })
        }
    }
    
    private(set) var postById: [String: FeedItem] = [:]

    init() {
        
        fetchPosts()
    }
    
    func fetchPosts() {
        Task {
            posts = try await FileApiManager.shared.apiService.fetch(with: FeedRequestable.feed(page: 1))
        }
    }
}
