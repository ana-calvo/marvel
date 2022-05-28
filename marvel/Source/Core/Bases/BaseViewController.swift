//
//  BaseViewController.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // Presenter
    var presenter: BasePresenter! {
        return nil
    }
    
    // Handlers
    var viewDidLoadHandler: ((_ viewController: BaseViewController) -> Void)?
    
    var viewWillAppearHandler: ((_ viewController: BaseViewController) -> Void)?
    
    var viewDidAppearHandler: ((_ viewController: BaseViewController) -> Void)?
    
    var viewWillDisappearHandler: ((_ viewController: BaseViewController) -> Void)?
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        if self.viewDidLoadHandler != nil { self.viewDidLoadHandler!(self) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
        
        if self.viewWillAppearHandler != nil { self.viewWillAppearHandler!(self) }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.viewDidAppear()
        
        if self.viewDidAppearHandler != nil { self.viewDidAppearHandler!(self) }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter.viewWillDisappear()
        
        if self.viewWillDisappearHandler != nil { self.viewWillDisappearHandler!(self) }
    }
    
}

// MARK: - Methods
extension BaseViewController {
    
    func showAlert(title: String, message: String, action: String, style: UIAlertAction.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: action, style: style, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
