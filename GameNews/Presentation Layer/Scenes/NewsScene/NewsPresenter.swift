//
//  NewsPresenter.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol NewsPresentationLogic: AnyObject {
    func present(data: [NewsModel])
}

class NewsPresenter {
    // MARK: - Variables
    weak var newsViewController: NewsDisplayLogic?
}

// MARK: - Presentation logic
extension NewsPresenter: NewsPresentationLogic {
    func present(data: [NewsModel]) {
        var newCellModel = [NewsCellModel]()
        
        for news in data {
            for index in 0..<news.titles.count {
                newCellModel.append(NewsCellModel(title: news.titles[index],
                                                  imgURL: news.imgURLs[index],
                                                  postTime: news.postTimes[index],
                                                  hrefURL: news.hrefURLs[index],
                                                  webPageLogo: news.webPageLogo,
                                                  webPageName: news.webPageName,
                                                  webPageURL: news.webPageURL))
            }
        }

        
        newsViewController?.display(data: newCellModel)
    }
}
