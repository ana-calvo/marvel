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
    
}