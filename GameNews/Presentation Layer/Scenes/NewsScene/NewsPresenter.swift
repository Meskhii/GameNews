//
//  NewsPresenter.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol NewsPresentationLogic: AnyObject {
    func present(data: NewsModel)
}

class NewsPresenter {
    weak var newsViewController: NewsDisplayLogic?
}

// MARK: - Presentation logic
extension NewsPresenter: NewsPresentationLogic {
    func present(data: NewsModel) {
        var newCellModel = [NewsCellModel]()

        for index in 0..<data.titles.count {
            newCellModel.append(NewsCellModel(title: data.titles[index],
                                              imgURL: data.imgURLs[index],
                                              postTime: data.postTimes[index],
                                              hrefURL: data.hrefURLs[index]))
        }
        newsViewController?.display(data: newCellModel)
    }
}
