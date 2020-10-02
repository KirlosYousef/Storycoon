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

class APIService{
    
    static let shared = APIService()
    
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
