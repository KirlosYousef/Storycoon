//
//  RealmService.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import Foundation
import RealmSwift

class RealmService{
    
    static let shared = RealmService()
    let realm = try! Realm()
    
    func addToDB(story: Story){
        try! realm.write {
            realm.add(story, update: .modified)
        }
    }
    
    func fetchStoriesFromDB(completionHandler: @escaping (Results<Story>) -> Void){
        let stories = realm.objects(Story.self).elements
        completionHandler(stories)
    }
}
