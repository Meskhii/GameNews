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
}

// MARK: - Business logic
extension NewsInteractor: NewsBusinessLogic {
    func fetchNews() {
        presenter?.presentData()
    }
}
