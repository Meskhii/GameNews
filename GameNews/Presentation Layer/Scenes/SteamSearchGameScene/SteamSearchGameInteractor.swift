//
//  SteamNewsInteractor.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import Foundation

protocol SteamSearchGameBusinessLogic {
    func fetchSearchedGame(by name: String)
}

class SteamSearchGameInteractor {
    // MARK: - Variables
    var presenter: SteamSearchGamePresentationLogic?
}

// MARK: - Business logic
extension SteamSearchGameInteractor: SteamSearchGameBusinessLogic {
    func fetchSearchedGame(by name: String) {
        var fetchedSearchResults: SearchResultModel?

        SteamSearchGameWorker.shared.searchForGames(searchWord: name) {searchResult in
            fetchedSearchResults = searchResult
        }

        if let searchResults = fetchedSearchResults {
            presenter?.present(data: searchResults)
        }
    }
}
