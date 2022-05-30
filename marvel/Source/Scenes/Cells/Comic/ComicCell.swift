//
//  ComicCell.swift
//  marvel
//
//  Created by Ana calvo on 30/5/22.
//

import UIKit

class ComicCell: UITableViewCell {
    
    // Statics
    static let cellIdentifier   = "comicIdentifier"
    
    static let className        = "ComicCell"
    
    static let nibInstance      = UINib(nibName: ComicCell.className, bundle: nil)
    
    static let height: CGFloat  = 64.0
    
    // Outlets
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.layer.cornerRadius = 4.0
        }
    }
    
    @IBOutlet weak var coverImageView: UIImageView! {
        didSet {
            coverImageView.image = nil
            coverImageView.layer.masksToBounds = true
            coverImageView.layer.cornerRadius = coverImageView.bounds.width / 2
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = ""
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = ""
        }
    }
    
}
