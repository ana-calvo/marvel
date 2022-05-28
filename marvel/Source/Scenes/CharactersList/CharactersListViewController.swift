//
//  CharactersListViewController.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import UIKit

class CharactersListViewController: BaseViewController {
    
    // Properties
    var characters: [CharacterViewData]?
    
    // Presenter
    var listPresenter: CharactersListPresenter!
    override var presenter: CharactersListPresenter! {
        return listPresenter
    }
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Presenter Methods
extension CharactersListViewController: CharactersListPresenterView {
    
    func performCharacters(characters: [CharacterViewData]) {
        self.characters = characters
        print("-----CHARACTERS LIST: \(self.characters!)-----")
    }
    
    func performError(message: String) {
        self.showAlert(
            title: "Error",
            message: message,
            action: "Understood",
            style: .default
        )
    }
}
