//
//  Story.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import Foundation

class Story: Decodable {
    
    @objc dynamic var section: String?
    @objc dynamic var title: String?
    @objc dynamic var abstract: String?
    @objc dynamic var url: String?
    @objc dynamic var pubDate: String?
    dynamic var images: [StoryImage] = []
    
    enum CodingKeys: String, CodingKey {
        case section
        case title
        case abstract
        case url
        case pubDate = "published_date"
        case images = "multimedia"
    }
    
}
