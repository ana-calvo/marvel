//
//  CharactersListPresenter.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import Foundation

protocol CharactersListPresenterView {
    
}

class CharactersListPresenter: BasePresenter {
    
    var view: CharactersListPresenterView?
    
    // Initializations
    init(view: CharactersListPresenterView) {
        self.view = view
    }
    
}
