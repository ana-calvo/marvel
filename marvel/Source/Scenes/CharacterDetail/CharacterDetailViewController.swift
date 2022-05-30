//
//  CharacterDetailViewController.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import UIKit

class CharacterDetailViewController: BaseViewController {
    
    // Outlets
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.image = nil
            profileImageView.layer.masksToBounds = true
            profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = ""
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = ""
        }
    }
    
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
        self.title = character.name
        
        self.profileImageView.setImage(urlString: character.picture)
        
        self.nameLabel.text = character.name
        
        if let description = character.description {
            self.descriptionLabel.text = description
        }
    }
    
    func performComics(comics: [ComicViewData]) {
        print("-------COMICS FETCHED: \(comics)-----")
    }
    
    func performError(message: String) {
        //
    }
    
}
