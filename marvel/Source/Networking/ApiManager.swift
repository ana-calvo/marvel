//
//  ApiManager.swift
//  marvel
//
//  Created by Ana calvo on 26/5/22.
//

import Foundation

struct ApiManager {
    
    // Shared instance (singleton) to be used.
    static let shared = ApiManager()
    
    let baseUrl = "https://gateway.marvel.com"
    let apiKey = "ts=1&apikey=046e8871fb43a046a9f26eb4e7afb441&hash=f94d8474c9c3177f4d075e5e1f8317b5"
    
    func performRequest(from endpoint: String, completion: @escaping (_ responseData: Data?, _ error: Error?) -> Void) {
        
        // Create a URL
        let urlString = "\(baseUrl)/\(endpoint)?\(apiKey)"
        if let url = URL(string: urlString) {
            
            // Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(nil, error)
                }
                
                if let fetchedData = data {
                    completion(fetchedData, nil)
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
}





