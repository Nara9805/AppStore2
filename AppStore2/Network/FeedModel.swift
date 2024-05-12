//
//  FeedModel.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 24.12.2023.
//

import Foundation

struct Feeds: Decodable {
    let feed: FeedModel
    
    enum CodingKeys: String, CodingKey {
        case feed
    }
}

struct FeedModel: Decodable {
    let title: String
    
    let results: [ResultModel]
    
    enum CodingKeys: String, CodingKey {
        case title, results
    }
}

struct ResultModel: Decodable {
    let artistName: String
    let id: String
    let name: String
    let artworkUrl100: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, name, artworkUrl100
    }
}

struct SearchResult: Decodable {
    let results: [SearchResultModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct SearchResultModel: Decodable {
    let screenshotUrls: [String]
    let artworkUrl100: String
    let description: String
    let trackId: Int //appId
    let trackName: String
    let artistName: String
    
    enum CodingKeys: String, CodingKey {
        case screenshotUrls, artworkUrl100, description, trackId, trackName, artistName
    }
}
