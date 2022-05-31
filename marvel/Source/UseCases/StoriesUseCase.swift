//
//  StoriesUseCase.swift
//  marvel
//
//  Created by Ana calvo on 31/5/22.
//

import Foundation

enum StoriesResultCase {
    case successCase(stories: [Product])
    case unknownError
}

class StoriesUseCase: BaseUseCase {
    
    // Properties
    let characterId: Int
    
    // Initializations
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    // Run use case
    override func execute() {
        self.getStories()
    }
}

// MARK: - Service
extension StoriesUseCase {
    
    //
    private func getStories() {
        
        CharactersService.shared.getStories(characterId: self.characterId) { responseData, error in
            
            if error == nil, let storiesList = responseData {
                
                var stories: [Product] = []
                
                storiesList.forEach { (story) in
                    stories.append(story)
                }
                
                self.completionCase(StoriesResultCase.successCase(stories: stories))
                
            } else {
                self.completionCase(StoriesResultCase.unknownError, error: error)
            }
        }
    }
    
}
