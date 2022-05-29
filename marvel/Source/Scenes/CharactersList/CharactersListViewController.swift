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
    
    //Outlets
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(CharacterCell.nibInstance, forCellReuseIdentifier: CharacterCell.cellIdentifier)
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.color = UIColor.darkGray
        }
    }
    
    
    // Presenter
    var listPresenter: CharactersListPresenter!
    override var presenter: CharactersListPresenter! {
        return listPresenter
    }
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoading()
        self.title = "Marvel characters"
    }
    
}

// MARK: - Presenter Methods
extension CharactersListViewController: CharactersListPresenterView {
    
    func performCharacters(characters: [CharacterViewData]) {
        
        self.characters = characters
        self.stopLoading()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
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

// MARK: - TableView Methods
extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let charactersList = self.characters {
            return charactersList.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let charactersList = self.characters else { return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.cellIdentifier, for: indexPath) as? CharacterCell else { return UITableViewCell() }
        
        cell.avatarImageView.setImage(urlString: charactersList[indexPath.row].picture)
        cell.titleLabel.text = charactersList[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let charactersList = self.characters {
            self.presenter.showCharacterDetails(id: charactersList[indexPath.row].id)
        }
        
    }
    
}

// MARK: - Methods
extension CharactersListViewController {
    
    private func startLoading() {
        self.backgroundView.backgroundColor = .white
        self.tableView.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    private func stopLoading() {
        DispatchQueue.main.async {
            self.backgroundView.backgroundColor = .systemGray6
            self.tableView.isHidden = false
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
    
}


