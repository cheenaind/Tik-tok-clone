//
//  FeedRequestable.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 15.08.25.
//

enum FeedRequestable: Requestable {
    var url: String {
        switch self {
        case .feed(let page):
            return "feed_page\(page)_enriched"
        }
    }
    
    var path: String { "json" }
    
    case feed(page: Int)
}
