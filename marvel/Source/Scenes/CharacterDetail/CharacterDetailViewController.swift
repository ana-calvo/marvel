//
//  CharacterDetailViewController.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import UIKit

class CharacterDetailViewController: BaseViewController {
    
    // Properties
    var comics: [ProductViewData]?
    var events: [ProductViewData]?
    var series: [ProductViewData]?
    var stories: [ProductViewData]?
    
    var selectedIndex: Int = 0
    
    // Outlets
    @IBOutlet weak var headerView: UIView! {
        didSet {
            headerView.layer.cornerRadius = 5.0
        }
    }
    
    @IBOutlet weak var shadowProfileView: UIView! {
        didSet {
            shadowProfileView.clipsToBounds = false
            shadowProfileView.layer.shadowColor = UIColor.black.cgColor
            shadowProfileView.layer.shadowOpacity = 0.5
            shadowProfileView.layer.shadowOffset = CGSize.zero
            shadowProfileView.layer.shadowRadius = 6
            shadowProfileView.layer.shadowPath = UIBezierPath(roundedRect: shadowProfileView.bounds, cornerRadius: shadowProfileView.bounds.width / 2).cgPath
        }
    }
    
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
    
    @IBOutlet weak var segmentedControl: UISegmentedControl! {
        didSet {
            segmentedControl.setTitle("Comics", forSegmentAt: 0)
            segmentedControl.setTitle("Events", forSegmentAt: 1)
            segmentedControl.setTitle("Series", forSegmentAt: 2)
            segmentedControl.setTitle("Stories", forSegmentAt: 3)
            segmentedControl.backgroundColor = .systemGray5
            segmentedControl.selectedSegmentTintColor = .white.withAlphaComponent(0.5)
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        }
    }
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.color = UIColor.darkGray
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(ProductCell.nibInstance, forCellReuseIdentifier: ProductCell.cellIdentifier)
            tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }
 
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoading()
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
    
    func performComics(comics: [ProductViewData]) {
        self.comics = comics
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
        }
    }
    
    func performEvents(events: [ProductViewData]) {
        self.events = events
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
        }
    }
    
    func performSeries(series: [ProductViewData]) {
        self.series = series
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
        }
    }
    
    func performStories(stories: [ProductViewData]) {
        self.stories = stories
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
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
            self.stopLoading()
        }
    }
    
}

// MARK: - TableView Methods
extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.selectedIndex {
            
            // Comics
        case 0:
            if let comicsList = self.comics, comicsList.count > 0 {
                return comicsList.count
            } else {
                return 0
            }
            
            // Events
        case 1:
            if let eventsList = self.events, eventsList.count > 0 {
                return eventsList.count
            } else {
                return 0
            }
            
            // Series
        case 2:
            if let seriesList = self.series, seriesList.count > 0 {
                return seriesList.count
            } else {
                return 0
            }
            
            // Stories
        case 3:
            if let storiesList = self.stories, storiesList.count > 0 {
                return storiesList.count
            } else {
                return 0
            }
            
        default:
            return 0
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellIdentifier, for: indexPath) as? ProductCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        switch self.selectedIndex {
            
        case 0:
            guard let comicsList = self.comics else { return UITableViewCell() }
            
            cell.coverImageView.setImage(urlString: comicsList[indexPath.row].cover)
            cell.titleLabel.text = comicsList[indexPath.row].title.capitalized
            
        case 1:
            guard let eventsList = self.events else { return UITableViewCell() }
            
            cell.coverImageView.setImage(urlString: eventsList[indexPath.row].cover)
            cell.titleLabel.text = eventsList[indexPath.row].title.capitalized
            
        case 2:
            guard let seriesList = self.series else { return UITableViewCell() }
            
            cell.coverImageView.setImage(urlString: seriesList[indexPath.row].cover)
            cell.titleLabel.text = seriesList[indexPath.row].title.capitalized
            
        case 3:
            guard let storiesList = self.stories else { return UITableViewCell() }
            
            cell.coverImageView.setImage(urlString: storiesList[indexPath.row].cover)
            cell.titleLabel.text = storiesList[indexPath.row].title.capitalized
            
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProductCell.height
    }
    
}





// MARK: - Actions
extension CharacterDetailViewController {
    
    @IBAction func updateProduct(_ sender: UISegmentedControl) {
        self.selectedIndex = sender.selectedSegmentIndex
        self.startLoading()
        self.updateProductInformation(at: sender.selectedSegmentIndex)
    }
    
}

// MARK: - Methods
extension CharacterDetailViewController {
    
    private func startLoading() {
        self.view.isUserInteractionEnabled = false
        self.tableView.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    private func stopLoading() {
        self.view.isUserInteractionEnabled = true
        self.tableView.isHidden = false
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    private func updateProductInformation(at index: Int) {
        if index == 0 {
            self.presenter.loadComics()
        } else if index == 1 {
            self.presenter.loadEvents()
        } else if index == 2 {
            self.presenter.loadSeries()
        } else if index == 3 {
            self.presenter.loadStories()
        }
    }
    
}
