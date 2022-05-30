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

// MARK: - Methods
extension BasePresenter {
    
    func getThumbnailUrl(thumbnail: Thumbnail?, size: String) -> String {
        
        var thumbnailPath = ""
        var thumbnailUrl = ""
        
        if let thumbnail = thumbnail, let path = thumbnail.path, let ext = thumbnail.extension {
            
            // It conforms AppTransportSecurity (ATS) policy
            if !path.contains("https") {
                var comps = URLComponents(string: path)!
                comps.scheme = "https"
                thumbnailPath = comps.string!
                
            } else {
                thumbnailPath = path
            }
            
            thumbnailUrl = "\(thumbnailPath)/\(size).\(ext)"
        }
        
        return thumbnailUrl
    }
    
}
