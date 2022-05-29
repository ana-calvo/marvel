//
//  CharacterDetailViewController.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import UIKit

class CharacterDetailViewController: BaseViewController {

    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Presenter
    var detailPresenter: CharacterDetailPresenter!
    override var presenter: CharacterDetailPresenter! {
        return detailPresenter
    }

}

// MARK: - Presenter Methods
extension CharacterDetailViewController: CharacterDetailPresenterView {
    
    func performDetails(character: CharacterViewData) {
        print("---I'm \(character.name)----")
    }
    
}
