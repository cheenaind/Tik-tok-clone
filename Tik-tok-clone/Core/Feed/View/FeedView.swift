//
//  FeedView.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import SwiftUI
import AVFoundation

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { feed in
                    FeedCell(feed: feed, player: player)
                        .id(feed.id)
                }
            }
            .scrollTargetLayout()
        }
        .onAppear(perform: {
            player.play()
        })
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            handleScrollAction(with: newValue)
        }.onAppear {
            viewModel.initialLoad()
        }
    }
    
    private func handleScrollAction(with position: String?) {
        guard let position else { return }
        playVideoOnChangeScroll(position: position)
        handlePagingScroll(with: position)
    }
    
    private func playVideoOnChangeScroll(position: String) {
        guard let currentVideo = viewModel.postById[position] else { return }
        player.replaceCurrentItem(with: nil)
        
        let playerItem = AVPlayerItem(url: currentVideo.media.playbackUrl)
        
        player.replaceCurrentItem(with: playerItem)
    }
    
    private func handlePagingScroll(with position: String) {
        guard position == viewModel.posts.last!.id else { return }
        
        Task {
            viewModel.loadNext()
        }
    }
}

#Preview {
    FeedView()
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
