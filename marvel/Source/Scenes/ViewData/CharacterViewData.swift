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
        
        var path = character.thumbnail.path
        
        // It conforms AppTransportSecurity (ATS) policy
        if !path.contains("https") {
            var comps = URLComponents(string: path)!
            comps.scheme = "https"
            path = comps.string!
        }
        
        let pictureUrl = "\(path)/standard_medium.\(character.thumbnail.extension)"
        
        return CharacterViewData(
            id: character.id,
            name: character.name,
            description: (character.description.isEmpty) ? "This character wants to preserve privacy" : character.description,
            picture: pictureUrl
        )
    }
}
