//
//  CharacterDetailNavigation.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit

class CharacterDetailNavigation: BaseNavigationObject {
    
    var characterNavigationAdapter: CharacterDetailNavigationAdapter?
    
    override var adapter: CharacterDetailNavigationAdapter? {
        return characterNavigationAdapter
    }
    
    init(sender: UIViewController) {
        let targetViewController: CharacterDetailViewController = ServiceLocator.inject()
        super.init(sender: sender, target: targetViewController)
    }
    
    func navigateWith(adapter: CharacterDetailNavigationAdapter) {
        self.characterNavigationAdapter = adapter
        guard let targetViewController = self.target as? CharacterDetailViewController else { return }
        targetViewController.presenter.adapter = adapter
    }
    
}

