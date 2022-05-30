//
//  UIImageView_Extension.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else { return }
        
        if let imageData = try? Data(contentsOf: url) {
            if let loadedImage = UIImage(data: imageData) {
                self.image = loadedImage
            }
        }
    }
    
    // If there is no image available, a default one is set up
    func setImage(urlString: String) {
        if urlString.contains("image_not_available") || urlString.isEmpty {
            self.image = UIImage(named: "marvel_logo")
        } else {
            self.loadFrom(URLAddress: urlString)
        }
    }

}
