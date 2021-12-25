//
//  Video.swift
//  Yapp
//
//  Created by aleksandre on 22.12.21.
//

import Foundation


struct Video: Decodable {
    
    var videoId: String
    var title: String
    var description: String
    var thumbnail: String
    var published: Date
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse the description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // parse video id
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
    
}


struct TMPVideo {
    
    var videoId: String
    var title: String
    var description: String
    var thumbnail: String
    var published: String
}


