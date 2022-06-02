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
    var description: String?
    var pictureURL: String
    
    init(id: Int, name: String, description: String? = nil, pictureURL: String) {
        self.id = id
        self.name = name
        self.description = description
        self.pictureURL = pictureURL
    }

}
