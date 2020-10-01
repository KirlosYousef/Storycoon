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
    @objc dynamic var caption: String?
    
    enum CodingKeys: String, CodingKey {
        case urlString = "url"
        case caption
    }
    
}
protocol Displayable {
    var url: URL? { get }
}

extension StoryImage: Displayable {
    var url: URL? {
        if urlString == nil {
            return nil
        }
        return URL(string: urlString!)!
    }
}
