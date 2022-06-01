//
//  BasePresenter.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import Foundation

class BasePresenter {
    
    // This property allows to pass data between scenes
    var adapter: NavigationAdapter?
    
    // Life cycle
    func viewDidLoad() { }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
  
}
