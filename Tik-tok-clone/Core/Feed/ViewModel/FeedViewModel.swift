//
//  FeedViewModel.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]() {
        didSet {
            postById = Dictionary(uniqueKeysWithValues: posts.map { ($0.id, $0) })
        }
    }
    
    private(set) var postById: [String: Post] = [:]

    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        posts = [
            .init(id: UUID().uuidString, videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
            .init(id: UUID().uuidString, videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
            .init(id: UUID().uuidString, videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
            .init(id: UUID().uuidString, videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),

        ]
    }
}
