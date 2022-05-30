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
    func performComics(comics: [ComicViewData])
    func performError(message: String)
}

class CharacterDetailPresenter: BasePresenter {
    
    // Properties
    var character: Character?
    let errorMessage = "Something went wrong 😕. Please, try again later"

    var view: CharacterDetailPresenterView?
    
    // Initializations
    init(view: CharacterDetailPresenterView) {
        self.view = view
    }
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCharacterData()
        self.getComics()
    }
    
}

// MARK: - Methods
extension CharacterDetailPresenter {
    
    private func loadCharacterData() {
        
        guard let view = self.view else { return }
        
        if let adapter = self.adapter as? CharacterDetailNavigationAdapter {
            
            self.character = adapter.character
            
            let data = CharacterViewData(id: adapter.character.id!,
                                         name: adapter.character.name!,
                                         description: adapter.character.description,
                                         picture: self.preparePicture(thumbnail: adapter.character.thumbnail))
            
            view.performDetails(character: data)
        }
        
    }
    
    //
    private func getComics() {
        
        guard let view = self.view else { return }
        guard let character = self.character else { return }
       
        CharactersDomain.UseCases.getComics(characterId: character.id!) { result in
            
            switch result {
                
            case .successCase(let comics):
                let comicsViewData = self.prepareComics(comics: comics)
                view.performComics(comics: comicsViewData)
                
            case .unknownError:
                view.performError(message: self.errorMessage)
            }
        }

    }
    
    
    private func prepareComics(comics: [Comic]) -> [ComicViewData] {
        
        var comicsViewData: [ComicViewData] = []
        
        comics.forEach { (comic) in
            
            // If there are no id and no title values to identify the comic, it is not considerated
            if let id = comic.id, let title = comic.title {
                
                let comicViewData = ComicViewData(
                    id: id,
                    title: title,
                    description: comic.description,
                    coverImage: self.preparePicture(thumbnail: comic.thumbnail)
                )
                
                comicsViewData.append(comicViewData)
            }
        }
        
        return comicsViewData
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
            
            pictureUrl = "\(picturePath)/standard_large.\(ext)"
        }
        
        return pictureUrl
    }
    
}



