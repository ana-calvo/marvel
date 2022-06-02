//
//  ProductViewData.swift
//  marvel
//
//  Created by Ana calvo on 30/5/22.
//

import Foundation

struct ProductViewData {
    
    let id: Int
    let title: String
    let coverURL: String
    
    init(id: Int, title: String, coverURL: String) {
        self.id = id
        self.title = title
        self.coverURL = coverURL
    }
}
