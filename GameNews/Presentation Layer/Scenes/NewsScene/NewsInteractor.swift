//
//  NewsInteractor.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol NewsBusinessLogic {
    func fetchNews()
}

class NewsInteractor {
    // MARK: - Variables
    var presenter: NewsPresentationLogic?
    var ignManager: IgnManager!
    var gameInformerManager: GameInformerManager!
}

// MARK: - Business logic
extension NewsInteractor: NewsBusinessLogic {
    func fetchNews() {
        var fetchedNews = [NewsModel]()
        ignManager = IgnManager()
        gameInformerManager = GameInformerManager()

        ignManager.fetchNews { news in
            fetchedNews.append(news)
        }
        
        gameInformerManager.fetchNews { news in
            fetchedNews.append(news)
        }
        

        if !fetchedNews.isEmpty {
            presenter?.present(data: fetchedNews)
        }
    }
}
