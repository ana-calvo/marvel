//
//  CharacterCell.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    // Statics
    static let cellIdentifier   = "characterIdentifier"
    
    static let className        = "CharacterCell"
    
    static let nibInstance      = UINib(nibName: CharacterCell.className, bundle: nil)
    
    static let height: CGFloat  = 64.0
    
    // Outlets
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.layer.cornerRadius = 4.0
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.image = nil
            avatarImageView.layer.masksToBounds = true
            avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = ""
        }
    }
    
}

