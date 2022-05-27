//
//  CharactersService.swift
//  marvel
//
//  Created by Ana calvo on 26/5/22.
//

import Foundation

class CharactersService {
    
    // Shared instance (singleton) to be used.
    static let shared = CharactersService()
    
    private let charactersEndpoint = "v1/public/characters"
    
    func getCharacters(completion: @escaping (_ responseData: [Character]?, _ error: Error?) -> Void) {
        
        ApiManager.shared.performRequest(from: charactersEndpoint) { responseData, error in
            if let data = responseData {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(Characters.self, from: data)
                    completion(decodedData.data.results, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
}
