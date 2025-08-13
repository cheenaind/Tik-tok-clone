//
//  UserStackView.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//
import SwiftUI

struct UserStackView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(Color(.gray))
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStackView(value: 5, title: "Followers")
}
