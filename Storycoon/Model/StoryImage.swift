//
//  StoryImages.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import Foundation
import RealmSwift

class StoryImage: Object, Decodable {
    
    @objc dynamic var urlString: String?
    
    enum CodingKeys: String, CodingKey {
        case urlString = "url"
    }
    
}
protocol Displayable {
    var url: URL? { get }
}

extension StoryImage: Displayable {
    var url: URL? {
        if urlString == nil {
            return URL(string: "https://upload.wikimedia.org/wikipedia/en/6/60/No_Picture.jpg")
        }
        return URL(string: urlString!)!
    }
}
