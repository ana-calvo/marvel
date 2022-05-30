//
//  Comic.swift
//  marvel
//
//  Created by Ana calvo on 30/5/22.
//

import Foundation

struct Comic: Decodable, Equatable {
    
    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: Thumbnail?
    
    static func == (lhs: Comic, rhs: Comic) -> Bool {
        return lhs.id == rhs.id
    }
}
