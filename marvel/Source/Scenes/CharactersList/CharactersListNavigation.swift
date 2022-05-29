//
//  CharactersListNavigation.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit

class CharactersListNavigation: BaseNavigationObject {
    
    var charactersNavigationAdapter: CharactersListNavigationAdapter?
    
    override var adapter: CharactersListNavigationAdapter? {
        return charactersNavigationAdapter
    }
    
    init(sender: UIViewController) {
        let targetViewController: CharactersListViewController = ServiceLocator.inject()
        super.init(sender: sender, target: targetViewController)
    }
    
    func navigateWith(adapter: CharactersListNavigationAdapter) {
        self.charactersNavigationAdapter = adapter
        guard let targetViewController = self.target as? CharactersListViewController else { return }
        targetViewController.presenter.adapter = adapter
    }
    
}




