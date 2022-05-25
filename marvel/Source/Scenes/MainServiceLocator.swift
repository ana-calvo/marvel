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
    }
    
    
    // Characters list
    private func provideCharactersListVC() -> CharactersListViewController {
        let viewController = CharactersListViewController(nibName: "CharactersListViewController", bundle: Bundle.main)
        viewController.listPresenter = CharactersListPresenter(view: viewController)
        return viewController
    }
    
}
