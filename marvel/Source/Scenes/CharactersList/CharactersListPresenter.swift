//
//  CharactersListPresenter.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import Foundation
import UIKit

protocol CharactersListPresenterView {
    func performCharacters(characters: [CharacterViewData])
    func performError(message: String)
}

class CharactersListPresenter: BasePresenter {
    
    // Properties
    var characters: [Character] = []
    let errorMessage = "Something went wrong 😕. Please, try again later"
    
    var view: CharactersListPresenterView?
    
    // Initializations
    init(view: CharactersListPresenterView) {
        self.view = view
    }
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCharacters()
    }
    
}

// MARK: - Actions
extension CharactersListPresenter {
    
    func showCharacterDetails(id: Int) {
        if let index = self.characters.firstIndex(where: { $0.id == id }) {
            let character = self.characters[index]
            self.navigateToDetail(character: character)
        }
    }
    
}

// MARK: - Methods
extension CharactersListPresenter {
    
    private func getCharacters() {
        
        guard let view = self.view else { return }
        
        CharactersDomain.UseCases.getCharacters { result in
            
            switch result {
                
            case .successCase(let characters):
                
                self.characters = characters
                let charactersViewData = self.prepareCharacters(characters: characters)
                
                view.performCharacters(characters: charactersViewData)
                
            case .unknownError:
                view.performError(message: self.errorMessage)
            }
        }
        
    }
    
    private func prepareCharacters(characters: [Character]) -> [CharacterViewData] {
        
        var charactersViewData: [CharacterViewData] = []
        
        characters.forEach { (character) in
            
            // If there are no id and no name values to identify the character, it is not considerated
            if let id = character.id, let name = character.name {
                
                let characterViewData = CharacterViewData(
                    id: id,
                    name: name,
                    description: character.description,
                    picture: self.preparePicture(thumbnail: character.thumbnail)
                )
                
                charactersViewData.append(characterViewData)
            }
        }
        
        return charactersViewData
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

// MARK: - Navigations
extension CharactersListPresenter {
    
    private func navigateToDetail(character: Character) {
        guard let sender = self.view as? CharactersListViewController else { return }
        let adapter = CharacterDetailNavigationAdapter(character: character)
        CharacterDetailNavigation(sender: sender).navigateWith(adapter: adapter)
    }
}
