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
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
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
            playVideoOnChangeScroll(postId: newValue)
        }
    }
    
    private func playVideoOnChangeScroll(postId: String?) {
        guard let postId, let current = viewModel.postById[postId] else { return }
        player.replaceCurrentItem(with: nil)
        
        let playerItem = AVPlayerItem(url: URL(string: current.videoURL)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
