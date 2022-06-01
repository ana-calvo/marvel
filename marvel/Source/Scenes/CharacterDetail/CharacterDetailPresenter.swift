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
    func performComics(comics: [ProductViewData])
    func performEvents(events: [ProductViewData])
    func performSeries(series: [ProductViewData])
    func performStories(stories: [ProductViewData])
    func performError(error: ErrorViewData)
}

class CharacterDetailPresenter: BasePresenter {
    
    // Properties
    var character: Character?
    let error: ErrorViewData = ErrorViewData(title: "Error", description: "Something went wrong 😕 \n Please, try later.", actionTitle: "OK")
    
    var view: CharacterDetailPresenterView?
    
    // Initialization
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

// MARK: - Actions
extension CharacterDetailPresenter {
    
    func loadComics() {
        self.getComics()
    }
    
    func loadEvents() {
        self.getEvents()
    }
    
    func loadSeries() {
        self.getSeries()
    }
    
    func loadStories() {
        self.getStories()
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
                                         picture: adapter.character.thumbnail?.createStringUrl(size: "standard_large") ?? ""
            )
            
            view.performDetails(character: data)
        }
        
    }
    
    private func getComics() {
        
        guard let view = self.view else { return }
        guard let character = self.character else { return }
        
        CharactersDomain.UseCases.getComics(characterId: character.id!) { result in
            
            switch result {
                
            case .successCase(let comics):
                let comicsViewData = self.prepareProduct(products: comics)
                view.performComics(comics: comicsViewData)
                
            case .unknownError:
                view.performError(error: self.error)
            }
        }
    }
    
    private func getEvents() {
        
        guard let view = self.view else { return }
        guard let character = self.character else { return }
        
        CharactersDomain.UseCases.getEvents(characterId: character.id!) { result in
            
            switch result {
                
            case .successCase(let events):
                let eventsViewData = self.prepareProduct(products: events)
                view.performEvents(events: eventsViewData)
                
            case .unknownError:
                view.performError(error: self.error)
            }
        }
    }
    
    private func getSeries() {
        
        guard let view = self.view else { return }
        guard let character = self.character else { return }
        
        CharactersDomain.UseCases.getSeries(characterId: character.id!) { result in
            
            switch result {
                
            case .successCase(let series):
                let seriesViewData = self.prepareProduct(products: series)
                view.performSeries(series: seriesViewData)
                
            case .unknownError:
                view.performError(error: self.error)
            }
        }
    }
    
    private func getStories() {
        
        guard let view = self.view else { return }
        guard let character = self.character else { return }
        
        CharactersDomain.UseCases.getStories(characterId: character.id!) { result in
            
            switch result {
                
            case .successCase(let stories):
                let storiesViewData = self.prepareProduct(products: stories)
                view.performStories(stories: storiesViewData)
                
            case .unknownError:
                view.performError(error: self.error)
            }
        }
    }
    
    private func prepareProduct(products: [Product]) -> [ProductViewData] {
        
        var productsViewData: [ProductViewData] = []
        
        products.forEach { (product) in
            
            // If there are no id and no title values to identify the comic, it is not considerated
            if let id = product.id, let title = product.title {
                
                let productViewData = ProductViewData(
                    id: id,
                    title: title,
                    cover: product.thumbnail?.createStringUrl(size: "portrait_small") ?? ""
                )
                
                productsViewData.append(productViewData)
            }
            
        }
        
        let orderedList = productsViewData.sorted(by: {$0.title < $1.title})
        return orderedList
    }
    
}



