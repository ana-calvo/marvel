//
//  UIImageView_Extension.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    // If there is no image available, a default one is set up
    func setImage(urlString: String) {
        
        if urlString.contains("image_not_available") || urlString.isEmpty {
            self.image = UIImage(named: "marvel_logo")
        
        } else {
            self.kf.setImage(with: URL(string: urlString), options: [.transition(.fade(0.25))])
        }
    }
    
}
