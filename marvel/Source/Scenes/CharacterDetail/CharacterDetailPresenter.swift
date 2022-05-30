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
    let errorMessage = "Something went wrong 😕"

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
                                         picture: self.getThumbnailUrl(thumbnail: adapter.character.thumbnail, size: "standard_large")
)
            
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
                    cover: self.getThumbnailUrl(thumbnail: comic.thumbnail, size: "standard_medium"),
                    position: comic.issueNumber
                )
                
                comicsViewData.append(comicViewData)
            }
   
        }
        
        let orderedList = comicsViewData.sorted(by: {$0.position ?? 0 < $1.position ?? 0})
        return orderedList
    }
    
}



