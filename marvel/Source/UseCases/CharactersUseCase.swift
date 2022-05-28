//
//  CharactersUseCase.swift
//  marvel
//
//  Created by Ana calvo on 28/5/22.
//

import Foundation

enum CharactersResultCase {
    case successCase(characters: [Character])
    case unknownError
}

class CharactersUseCase: BaseUseCase {
    
    // Run use case
    override func execute() {
        self.getCharacters()
    }
}

// MARK: - Service
extension CharactersUseCase {
    
    //
    private func getCharacters() {
        
        CharactersService.shared.getCharacters { responseData, error in
            
            if error == nil, let charactersList = responseData {
                
                var characters: [Character] = []
                
                charactersList.forEach { (character) in
                    characters.append(character)
                }
                
                self.completionCase(CharactersResultCase.successCase(characters: characters))
                
            } else {
                self.completionCase(CharactersResultCase.unknownError, error: error)
            }
        }
        
    }
    
}
