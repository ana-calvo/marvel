//
//  CharacterDetailPresenter.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit

protocol CharacterDetailPresenterView {
    func performDetails(character: CharacterViewData)
}

class CharacterDetailPresenter: BasePresenter {
    
    var view: CharacterDetailPresenterView?
    
    // Initializations
    init(view: CharacterDetailPresenterView) {
        self.view = view
    }
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCharacterData()
    }
    
}

// MARK: - Methods
extension CharacterDetailPresenter {
    
    private func loadCharacterData() {
        
        guard let view = self.view else { return }
        
        if let adapter = self.adapter as? CharacterDetailNavigationAdapter {
            let data = CharacterViewData.create(from: adapter.character)
            view.performDetails(character: data)
        }
        
    }
    
}



