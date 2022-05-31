//
//  ComicsUseCase.swift
//  marvel
//
//  Created by Ana calvo on 30/5/22.
//

import Foundation

enum ComicsResultCase {
    case successCase(comics: [Product])
    case unknownError
}

class ComicsUseCase: BaseUseCase {
    
    // Properties
    let characterId: Int
    
    // Initializations
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    // Run use case
    override func execute() {
        self.getComics()
    }
}

// MARK: - Service
extension ComicsUseCase {
    
    //
    private func getComics() {
        
        CharactersService.shared.getComics(characterId: self.characterId) { responseData, error in
            
            if error == nil, let comicsList = responseData {
                
                var comics: [Product] = []
                
                comicsList.forEach { (comic) in
                    comics.append(comic)
                }
                
                self.completionCase(ComicsResultCase.successCase(comics: comics))
                
            } else {
                self.completionCase(ComicsResultCase.unknownError, error: error)
            }
        }
    }
    
}
