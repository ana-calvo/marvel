//
//  CharactersDomain.swift
//  marvel
//
//  Created by Ana calvo on 28/5/22.
//

import Foundation

open class CharactersDomain {
    
    // Shared instance (singleton) to be used.
    static let UseCases = CharactersDomain()
    
    // Fetches the characters list
    func getCharacters(completion: @escaping (_ result: CharactersResultCase) -> Void) {
        
        let useCase = CharactersUseCase()
        
        useCase.completionHandle = { (resultCase) in
            
            if let result = resultCase as? CharactersResultCase {
                completion(result)
            }
        }
        useCase.execute()
    }
    
    // Fetches the comics list of a particular character
    func getComics(characterId: Int, completion: @escaping (_ result: ComicsResultCase) -> Void) {
        
        let useCase = ComicsUseCase(characterId: characterId)
        
        useCase.completionHandle = { (resultCase) in
            
            if let result = resultCase as? ComicsResultCase {
                completion(result)
            }
        }
        useCase.execute()
    }
    
    // Fetches the events list of a particular character
    func getEvents(characterId: Int, completion: @escaping (_ result: EventsResultCase) -> Void) {
        
        let useCase = EventsUseCase(characterId: characterId)
        
        useCase.completionHandle = { (resultCase) in
            
            if let result = resultCase as? EventsResultCase {
                completion(result)
            }
        }
        useCase.execute()
    }
    
    // Fetches the series list of a particular character
    func getSeries(characterId: Int, completion: @escaping (_ result: SeriesResultCase) -> Void) {
        
        let useCase = SeriesUseCase(characterId: characterId)
        
        useCase.completionHandle = { (resultCase) in
            
            if let result = resultCase as? SeriesResultCase {
                completion(result)
            }
        }
        useCase.execute()
    }
    
    // Fetches the stories list of a particular character
    func getStories(characterId: Int, completion: @escaping (_ result: StoriesResultCase) -> Void) {
        
        let useCase = StoriesUseCase(characterId: characterId)
        
        useCase.completionHandle = { (resultCase) in
            
            if let result = resultCase as? StoriesResultCase {
                completion(result)
            }
        }
        useCase.execute()
    }
    
}
