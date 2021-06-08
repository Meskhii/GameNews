//
//  SelectedGameNewsInteractor.swift
//  GameNews
//
//  Created by Admin on 07.06.2021.
//

import Foundation

protocol SelectedGameNewsBusinessLogic {
    func fetchSelectedGameNews(appId: String)
}

class SelectedGameNewsInteractor {
    // MARK: - Variables
    var presenter: SelectedGameNewsPresentationLogic?
    var worker: SelectedGameNewsWorker?
}

// MARK: - Business logic
extension SelectedGameNewsInteractor: SelectedGameNewsBusinessLogic {
    func fetchSelectedGameNews(appId: String) {
        var fetchedNews = [GameNewsModel]()
        worker = SelectedGameNewsWorker()

        worker?.fetchGameNews(appId: appId) { news in
            fetchedNews = news.appnews.newsitems
            DispatchQueue.main.async {
                self.presenter?.present(data: fetchedNews)
            }
        }
    }
}
