//
//  MainServiceLocator.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import Foundation

class MainServiceLocator: ServiceLocatorModule {
    
    func registerServices(serviceLocator: ServiceLocator) {
        
        // Characters list
        serviceLocator.register { self.provideCharactersListVC() }
        
        // Character detail
        serviceLocator.register { self.provideCharacterDetailVC() }
    }
    
    
    // Characters list
    private func provideCharactersListVC() -> CharactersListViewController {
        let viewController = CharactersListViewController(nibName: "CharactersListViewController", bundle: Bundle.main)
        viewController.listPresenter = CharactersListPresenter(view: viewController)
        return viewController
    }
    
    // Character detail
    private func provideCharacterDetailVC() -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController(nibName: "CharacterDetailViewController", bundle: Bundle.main)
        viewController.detailPresenter = CharacterDetailPresenter(view: viewController)
        return viewController
    }
    
}
