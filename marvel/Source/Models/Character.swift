//
//  Character.swift
//  marvel
//
//  Created by Ana calvo on 26/5/22.
//

import Foundation

struct Character: Decodable, Equatable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}
