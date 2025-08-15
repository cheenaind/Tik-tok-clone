import Foundation

// MARK: - Top Level Feed Structure
struct Feed: Decodable {
    let page: Int
    let limit: Int
    let items: [FeedItem]
    let nextPageUrl: String?
    let prevPageUrl: String?
}

// MARK: - Feed Item (Video)
struct FeedItem: Decodable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let media: Media
    let author: Author
    let stats: Stats
    let createdAt: Date
    let engagement: Engagement
    let hashtags: [String]
    let music: Music
    let geo: Geo?
}

// MARK: - Nested Models
struct Media: Decodable {
    let playbackUrl: URL
    let thumbUrl: URL
    let durationSec: Int
}

struct Author: Decodable {
    let id: String
    let handle: String
}

struct Stats: Decodable {
    let views: Int
    let likes: Int
    let shares: Int
    let comments: Int
}

struct Engagement: Decodable {
    let likedByUserIds: [String]
    let shareEvents: [ShareEvent]
    let comments: [Comment]
}

struct ShareEvent: Decodable {
    let id: String
    let userId: String
    let target: String
    let createdAt: Date
}

struct Comment: Decodable {
    let id: String
    let videoItemId: String
    let authorId: String
    let text: String
    let likeUserIds: [String]
    let createdAt: Date
    let replies: [Reply]
}

struct Reply: Decodable {
    let id: String
    let parentId: String
    let authorId: String
    let text: String
    let likeUserIds: [String]
    let createdAt: Date
}

struct Music: Decodable {
    let title: String
    let author: String
    let license: String
}

struct Geo: Decodable {
    let country: String
    let city: String
}
