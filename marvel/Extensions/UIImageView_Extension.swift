//
//  UIImageView_Extension.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(URLAddress: String, completion: @escaping (_ image: UIImage?) -> Void) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                    completion(loadedImage)
                }
            }
        }
    }
}
