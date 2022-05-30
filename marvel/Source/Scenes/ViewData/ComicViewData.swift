//
//  ComicViewData.swift
//  marvel
//
//  Created by Ana calvo on 30/5/22.
//

import Foundation

struct ComicViewData {
    
    let id: Int
    let title: String
    let description: String?
    let cover: String
    let position: Double?
    
    init(id: Int, title: String, description: String? = nil, cover: String, position: Double? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.cover = cover
        self.position = position
    }
}
