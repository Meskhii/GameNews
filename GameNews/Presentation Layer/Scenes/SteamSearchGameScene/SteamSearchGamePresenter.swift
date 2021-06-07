//
//  SteamNewsPresenter.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import Foundation

protocol SteamSearchGamePresentationLogic: AnyObject {
    func present(data: SearchResultModel)
}

class SteamSearchGamePresenter {
    weak var steamSearchGameViewController: SteamSearchGameDisplayLogic?
}

// MARK: - Presentation logic
extension SteamSearchGamePresenter: SteamSearchGamePresentationLogic {
    func present(data: SearchResultModel) {
        var searchResultCellModel = [SearchResultCellModel]()

        for index in 0..<data.titles.count {
            
            if index < 20 {
                searchResultCellModel.append(SearchResultCellModel(title: data.titles[index],
                                                                   imgURL: data.imgURLs[index],
                                                                   appId: data.appIds[index],
                                                                   releaseDate: data.releaseDate[index],
                                                                   gamePrice: data.gamePrices[index]))
            } else {
                steamSearchGameViewController?.display(data: searchResultCellModel)
            }
        }
    }
}
