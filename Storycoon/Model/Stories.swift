//
//  Stories.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import Foundation

class Stories:Decodable{
    
    var all: [Story]
    var numOfResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case all = "results"
        case numOfResults = "num_results"
    }
}
