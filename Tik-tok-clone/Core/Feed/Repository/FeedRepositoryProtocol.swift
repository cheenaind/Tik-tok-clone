//
//  FeedRepository.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

protocol FeedRepositoryProtocol {
    func load() async throws -> Feed
    func loadNext(with page: Int) async throws -> Feed
}


