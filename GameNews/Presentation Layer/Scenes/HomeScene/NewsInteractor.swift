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
}

// MARK: - Business logic
extension NewsInteractor: NewsBusinessLogic {
    func fetchNews() {
        var fetchedNews: NewsModel?
        ignManager = IgnManager()

        ignManager.fetchNews { ignNews in
            fetchedNews = ignNews
        }

        if let news = fetchedNews {
            presenter?.present(data: news)
        }
    }
}
