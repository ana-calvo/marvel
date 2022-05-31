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
    
    // Fetches list of characters
    func getCharacters(completion: @escaping (_ responseData: [Character]?, _ error: Error?) -> Void) {
        
        ApiManager.shared.performRequest(from: charactersEndpoint) { responseData, error in
            if let data = responseData {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(Characters.self, from: data)
                    if let data = decodedData.data, let results = data.results {
                        completion(results, nil)
                    }
                    
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    // Fetches comics related to a specific character
    func getComics(characterId: Int, completion: @escaping (_ responseData: [Product]?, _ error: Error?) -> Void) {
        
        let comicsEndpoint = "\(charactersEndpoint)/\(characterId)/comics"
        
        ApiManager.shared.performRequest(from: comicsEndpoint) { responseData, error in
            if let data = responseData {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(Products.self, from: data)
                    if let data = decodedData.data, let results = data.results {
                        completion(results, nil)
                    }
                    
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    // Fetches events related to a specific character
    func getEvents(characterId: Int, completion: @escaping (_ responseData: [Product]?, _ error: Error?) -> Void) {
        
        let eventsEndpoint = "\(charactersEndpoint)/\(characterId)/events"
        
        ApiManager.shared.performRequest(from: eventsEndpoint) { responseData, error in
            if let data = responseData {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(Products.self, from: data)
                    if let data = decodedData.data, let results = data.results {
                        completion(results, nil)
                    }
                    
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    // Fetches series related to a specific character
    func getSeries(characterId: Int, completion: @escaping (_ responseData: [Product]?, _ error: Error?) -> Void) {
        
        let seriesEndpoint = "\(charactersEndpoint)/\(characterId)/series"
        
        ApiManager.shared.performRequest(from: seriesEndpoint) { responseData, error in
            if let data = responseData {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(Products.self, from: data)
                    if let data = decodedData.data, let results = data.results {
                        completion(results, nil)
                    }
                    
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    // Fetches stories related to a specific character
    func getStories(characterId: Int, completion: @escaping (_ responseData: [Product]?, _ error: Error?) -> Void) {
        
        let storiesEndpoint = "\(charactersEndpoint)/\(characterId)/stories"
        
        ApiManager.shared.performRequest(from: storiesEndpoint) { responseData, error in
            if let data = responseData {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(Products.self, from: data)
                    if let data = decodedData.data, let results = data.results {
                        completion(results, nil)
                    }
                    
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
}
