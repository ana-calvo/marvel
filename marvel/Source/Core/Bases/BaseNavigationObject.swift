//
//  BaseNavigationObject.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit

class BaseNavigationObject {
    
    // Properties
    var sender: UIViewController
    
    var target: UIViewController
    
    var adapter: NavigationAdapter? {
        return nil
    }
    
    // Initialization
    init(sender: UIViewController, target: UIViewController) {
        self.sender = sender
        self.target = target
        self.navigate()
    }
    
}

// MARK: - Methods
extension BaseNavigationObject {
    
    // Push navigation
    private func navigate() {
        self.sender.navigationController?.pushViewController(self.target, animated: true)
    }
}
