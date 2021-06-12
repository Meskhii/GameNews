//
//  NewsInteractor.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol NewsBusinessLogic {
    func fetchNews(webPageNames: [String])
}

class NewsInteractor {
    // MARK: - Variables
    var presenter: NewsPresentationLogic?
    var ignManager: IgnManager!
    var gameInformerManager: GameInformerManager!
}

// MARK: - Business logic
extension NewsInteractor: NewsBusinessLogic {
    func fetchNews(webPageNames: [String]) {
        var fetchedNews = [NewsModel]()
        ignManager = IgnManager()
        gameInformerManager = GameInformerManager()

        if webPageNames.contains("ign_logo") {
            ignManager.fetchNews { news in
                fetchedNews.append(news)
            }
        }
        
        if webPageNames.contains("gameinformer_logo") {
            gameInformerManager.fetchNews { news in
                fetchedNews.append(news)
            }
        }
        
        if !fetchedNews.isEmpty {
            presenter?.present(data: fetchedNews)
        }
    }
}
