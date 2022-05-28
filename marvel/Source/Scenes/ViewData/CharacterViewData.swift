//
//  CharacterViewData.swift
//  marvel
//
//  Created by Ana calvo on 27/5/22.
//

import Foundation

//
struct CharacterViewData {
    
    var id: Int
    var name: String
    var description: String
    var picture: String
    
    init(id: Int, name: String, description: String, picture: String) {
        self.id = id
        self.name = name
        self.description = description
        self.picture = picture
    }
    
    static func create(from character: Character) -> CharacterViewData {
        
        let pictureUrl = "\(character.thumbnail.path)/standard_small.\(character.thumbnail.extension)"
        
        return CharacterViewData(
            id: character.id,
            name: character.name,
            description: (character.description.isEmpty) ? "This character wants to preserve privacy" : character.description,
            picture: pictureUrl
        )
    }
}
