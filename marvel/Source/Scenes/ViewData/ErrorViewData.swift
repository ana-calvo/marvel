//
//  ErrorViewData.swift
//  marvel
//
//  Created by Ana calvo on 31/5/22.
//

import Foundation

struct ErrorViewData {
    
    let title: String
    let description: String
    let actionTitle: String
    
    init(title: String, description: String, actionTitle: String) {
        self.title = title
        self.description = description
        self.actionTitle = actionTitle
    }
}
