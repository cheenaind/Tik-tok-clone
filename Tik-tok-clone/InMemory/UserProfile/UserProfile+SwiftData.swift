//
//  UserProfile+SwiftData.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 18.08.25.
//

import SwiftData

@Model
class LocalUserProfile {
    var id: String
    var username: String
    var fullName: String
    var profilePictureUrl: String
    var isVerified: Bool
    var phone: String
    
    init(
        id: String,
        username: String,
        fullName: String,
        profilePictureUrl: String,
        isVerified: Bool,
        phone: String
    ) {
        self.id = id
        self.username = username
        self.fullName = fullName
        self.profilePictureUrl = profilePictureUrl
        self.isVerified = isVerified
        self.phone = phone
    }
}
