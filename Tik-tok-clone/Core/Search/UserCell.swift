//
//  UserCell.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray5))
            
            VStack(alignment: .leading) {
                Text("text_user")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("TestName")
                    .font(.callout)
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
