//
//  NewsPresenter.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol NewsPresentationLogic: AnyObject {
    func presentData()
}

class NewsPresenter {
    weak var newsViewController: NewsDisplayLogic?
}

// MARK: - Presentation logic
extension NewsPresenter: NewsPresentationLogic {
    func presentData() {
    }
}
