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
    func performError(error: ErrorViewData)
}

class CharactersListPresenter: BasePresenter {
    
    // Properties
    var characters: [Character] = []
    let error: ErrorViewData = ErrorViewData(title: "Error", description: "Something went wrong 😕 \n Please, come back later.", actionTitle: "OK")
    
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
    
    func reloadCharacters() {
        self.getCharacters()
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
                view.performError(error: self.error)
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
                    picture: self.getThumbnailUrl(thumbnail: character.thumbnail, size: "standard_medium")
                )
                
                charactersViewData.append(characterViewData)
            }
        }
        
        let orderedList = charactersViewData.sorted(by: {$0.name < $1.name})
        return orderedList
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
