//
//  SeriesUseCase.swift
//  marvel
//
//  Created by Ana calvo on 31/5/22.
//

import Foundation

enum SeriesResultCase {
    case successCase(series: [Product])
    case unknownError
}

class SeriesUseCase: BaseUseCase {
    
    // Properties
    let characterId: Int
    
    // Initializations
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    // Run use case
    override func execute() {
        self.getSeries()
    }
}

// MARK: - Service
extension SeriesUseCase {
    
    //
    private func getSeries() {
        
        CharactersService.shared.getSeries(characterId: self.characterId) { responseData, error in
            
            if error == nil, let seriesList = responseData {
                
                var series: [Product] = []
                
                seriesList.forEach { (serie) in
                    series.append(serie)
                }
                
                self.completionCase(SeriesResultCase.successCase(series: series))
                
            } else {
                self.completionCase(SeriesResultCase.unknownError, error: error)
            }
        }
    }
    
}
