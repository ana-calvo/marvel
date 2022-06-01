//
//  Thumbnail_Extension.swift
//  marvel
//
//  Created by Ana calvo on 1/6/22.
//

import Foundation

extension Thumbnail {
    
    func createStringUrl(size: String) -> String {
        
        var thumbnailPath = ""
        var thumbnailUrl = ""
        
        if let path = self.path, let ext = self.extension {
            
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



