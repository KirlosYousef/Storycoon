//
//  RealmService.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import Foundation
import RealmSwift

/// Responsible for all the Realm database services.
class RealmService{
    
    static let shared = RealmService()
    private let realm = try! Realm()
    private var currentBookmarked: [Story] = []
    
    /**
     Stores the story/article to the realm database.
     
     - Parameter story: The story/article to be stored.
     */
    func addToDB(story: Story){
        try! realm.write {
            realm.add(story, update: .modified)
            currentBookmarked.append(story)
        }
    }
    
    /**
     Fetches all the stored articles from the realm database.
     
     - Parameter completionHandler: Handles the Realm results.
     */
    func fetchStoriesFromDB(completionHandler: @escaping (Results<Story>) -> Void){
        let stories = realm.objects(Story.self).elements
        currentBookmarked = stories.map({$0})
        completionHandler(stories)
    }
    
    /**
     Checks if the story/article is already stored/bookmarked in the realm database.
     
     - Parameter story: The story/article to be checked.
     - Returns: `Bool` type. True if the story is stored, False if not.
     */
    func isBookmarked(story: Story) -> Bool{
        return currentBookmarked.contains(where: {$0.url == story.url})
    }
}
