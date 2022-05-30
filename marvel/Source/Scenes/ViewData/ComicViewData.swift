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
    let coverImage: String
    
    init(id: Int, title: String, description: String? = nil, coverImage: String) {
        self.id = id
        self.title = title
        self.description = description
        self.coverImage = coverImage
    }
}
