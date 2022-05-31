//
//  Product.swift
//  marvel
//
//  Created by Ana calvo on 30/5/22.
//

import Foundation

struct Product: Decodable, Equatable {
    
    let id: Int?
    let title: String?
    let thumbnail: Thumbnail?
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}
