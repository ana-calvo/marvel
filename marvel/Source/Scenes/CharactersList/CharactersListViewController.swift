//
//  CharactersListViewController.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import UIKit

class CharactersListViewController: BaseViewController {
    
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
    
}
