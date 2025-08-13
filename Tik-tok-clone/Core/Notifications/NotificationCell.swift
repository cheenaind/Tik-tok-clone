//
//  NotificationCell.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 32, height: 32)
            
            HStack {
                Text("Max Verstappen ")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray)) +
                
                Text(" liked one of your post. ")
                    .font(.footnote) +
                
                Text(" 3d")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }.padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
