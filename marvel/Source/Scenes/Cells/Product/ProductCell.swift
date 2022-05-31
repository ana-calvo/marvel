//
//  ProductCell.swift
//  marvel
//
//  Created by Ana calvo on 30/5/22.
//

import UIKit

class ProductCell: UITableViewCell {
    
    // Statics
    static let cellIdentifier   = "productIdentifier"
    
    static let className        = "ProductCell"
    
    static let nibInstance      = UINib(nibName: ProductCell.className, bundle: nil)
    
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
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = ""
        }
    }
    
}
