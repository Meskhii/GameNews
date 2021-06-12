//
//  EuroGamerManager.swift
//  GameNews
//
//  Created by user200006 on 6/12/21.
//

import Foundation
import SwiftSoup

protocol GamespotManagerProtocol {
    func fetchNews(completion: @escaping (NewsModel) -> Void)
}

class GamespotManager: GamespotManagerProtocol {
    func fetchNews(completion: @escaping (NewsModel) -> Void) {
        let urlString = "https://www.gamespot.com/news/"

        NewsWorker.shared.getGamespotNews(url: urlString) { (result: Result<NewsModel, Error>) in
            switch result {
            case .success(let news):
                completion(news)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension NewsWorker {

     func fetchLogicForGamespot(doc: Document) -> NewsModel? {

        let gamespotNewsModel: NewsModel?

        do {
            let titles = try doc.getElementsByClass("card-item__title ")
            let times = try doc.getElementsByClass("card-metadata ")
            let imgURLS = try doc.getElementsByClass("card-item__img overflow--hidden card-image-overlay order--one card-item__img--margin-right ")
            let items = try doc.getElementsByClass("card-item__content inner-space-top-small-rem inner-space-bottom-small-rem ")

            do {
                var titlesArray = [String]()
                var timesArray = [String]()
                var imgURLSArray = [String]()
                var hrefsArray = [String]()

                for time in times {
                    let tag = try time.select("time")
                    timesArray.append(try tag.text())
                }
                
                for img in imgURLS {
                    let tag = try img.select("img")
                    let fullImgUrl = try tag.attr("src")
                    imgURLSArray.append(fullImgUrl)
                }

                for title in titles {
                    titlesArray.append(try title.text())
                }
                
                
                for href in items {
                    let tag = try href.select("a")
                    let url = try tag.select("href")
                    let fullUrl = "https://www.gamespot.com/\(try url.attr("href"))"
                    hrefsArray.append(fullUrl)
                    
                }

                gamespotNewsModel = NewsModel(titles: titlesArray,
                                             imgURLs: imgURLSArray,
                                             postTimes: timesArray,
                                             hrefURLs: hrefsArray,
                                             webPageLogo: "gamespot_logo",
                                             webPageName: "Gamespot",
                                             webPageURL: "https://www.gamespot.com/news/")
                return gamespotNewsModel
            } catch {
                print("error")
            }
         } catch {
            print("error")
        }
        return nil
    }
}
