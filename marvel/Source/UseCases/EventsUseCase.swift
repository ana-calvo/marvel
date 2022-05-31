//
//  EventsUseCase.swift
//  marvel
//
//  Created by Ana calvo on 31/5/22.
//

import Foundation

enum EventsResultCase {
    case successCase(events: [Product])
    case unknownError
}

class EventsUseCase: BaseUseCase {
    
    // Properties
    let characterId: Int
    
    // Initializations
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    // Run use case
    override func execute() {
        self.getEvents()
    }
}

// MARK: - Service
extension EventsUseCase {
    
    //
    private func getEvents() {
        
        CharactersService.shared.getEvents(characterId: self.characterId) { responseData, error in
            
            if error == nil, let eventsList = responseData {
                
                var events: [Product] = []
                
                eventsList.forEach { (event) in
                    events.append(event)
                }
                
                self.completionCase(EventsResultCase.successCase(events: events))
                
            } else {
                self.completionCase(EventsResultCase.unknownError, error: error)
            }
        }
    }
    
}
