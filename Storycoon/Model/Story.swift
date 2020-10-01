//
//  Story.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import Foundation
import RealmSwift

class Story: Object, Decodable {
    
    @objc dynamic var section: String?
    @objc dynamic var title: String?
    @objc dynamic var abstract: String?
    @objc dynamic var url: String?
    @objc dynamic var pubDate: String?
    let images = List<StoryImage>()
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            self.section = try container.decode(String.self, forKey: .section)
            self.title = try container.decode(String.self, forKey: .title)
            self.pubDate = try container.decode(String.self, forKey: .pubDate)
            self.abstract = try container.decode(String.self, forKey: .abstract)
            self.url = try container.decode(String.self, forKey: .url)
            let imagesUrls = try container.decodeIfPresent([StoryImage].self, forKey: .images) ?? [StoryImage(from: decoder)]
            images.append(objectsIn: imagesUrls)
        } catch{
            return
        }
    }
    
    override class func primaryKey() -> String? {
        return "url"
    }
    
    enum CodingKeys: String, CodingKey {
        case section
        case title
        case abstract
        case url
        case pubDate = "published_date"
        case images = "multimedia"
    }
}
