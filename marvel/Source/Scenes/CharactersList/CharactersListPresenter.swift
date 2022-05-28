//
//  CharactersListPresenter.swift
//  marvel
//
//  Created by Ana calvo on 25/5/22.
//

import Foundation

protocol CharactersListPresenterView {
    func performCharacters(characters: [CharacterViewData])
    func performError(message: String)
}

class CharactersListPresenter: BasePresenter {
    
    // Properties
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

// MARK: - Methods
extension CharactersListPresenter {
    
    private func getCharacters() {
        
        guard let view = self.view else { return }
        
        CharactersDomain.UseCases.getCharacters { result in
            
            switch result {
                
            case .successCase(let characters):
                
                var charactersViewData: [CharacterViewData] = []
                
                characters.forEach { (character) in
                    let characterViewData = CharacterViewData.create(from: character)
                    charactersViewData.append(characterViewData)
                }
                
                view.performCharacters(characters: charactersViewData)
                
            case .unknownError:
                view.performError(message: self.errorMessage)
            }
        }
        
    }
    
}
