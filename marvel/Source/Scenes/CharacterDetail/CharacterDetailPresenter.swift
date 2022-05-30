//
//  CharacterDetailPresenter.swift
//  marvel
//
//  Created by Ana calvo on 29/5/22.
//

import Foundation
import UIKit

protocol CharacterDetailPresenterView {
    func performDetails(character: CharacterViewData)
}

class CharacterDetailPresenter: BasePresenter {
    
    var view: CharacterDetailPresenterView?
    
    // Initializations
    init(view: CharacterDetailPresenterView) {
        self.view = view
    }
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCharacterData()
    }
    
}

// MARK: - Methods
extension CharacterDetailPresenter {
    
    private func loadCharacterData() {
        
        guard let view = self.view else { return }
        
        if let adapter = self.adapter as? CharacterDetailNavigationAdapter {
            
            let data = CharacterViewData(id: adapter.character.id!,
                                         name: adapter.character.name!,
                                         description: adapter.character.description,
                                         picture: self.preparePicture(thumbnail: adapter.character.thumbnail))
            
            view.performDetails(character: data)
        }
        
    }
    
    
    private func preparePicture(thumbnail: Thumbnail?) -> String {
        
        var picturePath = ""
        var pictureUrl = ""
        
        if let thumbnail = thumbnail, let path = thumbnail.path, let ext = thumbnail.extension {
            
            // It conforms AppTransportSecurity (ATS) policy
            if !path.contains("https") {
                var comps = URLComponents(string: path)!
                comps.scheme = "https"
                picturePath = comps.string!
                
            } else {
                picturePath = path
            }
            
            pictureUrl = "\(picturePath)/standard_medium.\(ext)"
        }
        
        return pictureUrl
    }
    
}



