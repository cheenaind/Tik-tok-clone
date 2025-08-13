//
//  PostGridView.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import SwiftUI

struct PostGridView: View {
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible())
    ]
    
    private let width = (UIScreen.main.bounds.width / 3) - 2
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0 ..< 25) { _ in
                Rectangle()
                    .frame(height: 160)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView()
}
