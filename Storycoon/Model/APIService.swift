//
//  APIService.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import Foundation
import Alamofire


enum FetchingError: Error {
    case noConnection
}

/// Responsible for all the API services.
class APIService{
    
    static let shared = APIService()
    
    /**
     Fetches all the top articles from the API.
     
     - Parameter completionHandler: Sends back the result of type `Result` that contains either `Stories` if success or `FetchingError` if failure.
     */
    func fetchStories(completionHandler: @escaping (Result<Stories, FetchingError>) -> Void){
        let url = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=\(NYApiKey)"
        
        AF.request(url)
            .validate()
            .responseDecodable(of: Stories.self) { (response) in
                guard let stories = response.value else {
                    return completionHandler(.failure(.noConnection))
                }
                completionHandler(.success(stories))
            }
    }
}
