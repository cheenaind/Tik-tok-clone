//
//  MainTabView.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 13.08.25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("Feed", systemImage: "house", value: 0) {
                FeedView()
            }
            
            Tab("Friends", systemImage: "person.2", value: 1) {
                FriendsListView()
            }
            
            Tab("", systemImage: "plus", value: 2) {
                
            }
            
            Tab("Notifications", systemImage: "heart", value: 3) {
                NotificationsView()
            }
            
            Tab("Profile", systemImage: "person", value: 4) {
                UserProfileView()
            }
        }.tint(.black)
        
    }
}

#Preview {
    MainTabView()
}
