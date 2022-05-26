//
//  ApiManager.swift
//  marvel
//
//  Created by Ana calvo on 26/5/22.
//

import Foundation

struct ApiManager {
    
    let baseUrl = "https://gateway.marvel.com"
    
    func fetchData(endpoint: String) {
        let url = "\(baseUrl)/\(endpoint)?ts=1&apikey=046e8871fb43a046a9f26eb4e7afb441&hash=f94d8474c9c3177f4d075e5e1f8317b5"
        self.performRequest(urlString: url)
    }
    
    func performRequest(urlString: String) {
        
        // Create a URL
        if let url = URL(string: urlString) {
            
            // Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            
            // Start the task
            task.resume()
            
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let fetchedData = data {
            let dataString = String(data: fetchedData, encoding: .utf8)
            print(dataString)
        }
    }
    
}
