//
//  CharacterDetailViewController.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import UIKit

class CharacterDetailViewController: BaseViewController {
    
    // Properties
    var comics: [ComicViewData]?
    
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
    
    @IBOutlet weak var sectionDetailLabel: UILabel! {
        didSet {
            sectionDetailLabel.text = "Comics"
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(ComicCell.nibInstance, forCellReuseIdentifier: ComicCell.cellIdentifier)
            tableView.tableFooterView = UIView(frame: CGRect.zero)
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
        self.comics = comics
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func performError(message: String) {
        
        DispatchQueue.main.async {
            self.showAlert(
                title: "Error",
                message: message,
                action: "Try later",
                style: .default
            )
        }
    }
    
}

// MARK: - TableView Methods
extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let comicsList = self.comics, comicsList.count > 0 {
            return comicsList.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let comicsList = self.comics else { return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComicCell.cellIdentifier, for: indexPath) as? ComicCell else { return UITableViewCell() }
        
        cell.coverImageView.setImage(urlString: comicsList[indexPath.row].cover)
        cell.titleLabel.text = comicsList[indexPath.row].title.capitalized
        cell.descriptionLabel.text = comicsList[indexPath.row].description
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        self.tableView.estimatedRowHeight = ComicCell.height
        return UITableView.automaticDimension
    }
    
}
