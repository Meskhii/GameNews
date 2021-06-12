//
//  GameInformerManager.swift
//  GameNews
//
//  Created by user200006 on 6/11/21.
//

import Foundation
import SwiftSoup

protocol GameInformerManagerProtocol {
    func fetchNews(completion: @escaping (NewsModel) -> Void)
}

class GameInformerManager: GameInformerManagerProtocol {
    func fetchNews(completion: @escaping (NewsModel) -> Void) {
        let urlString = "https://www.gameinformer.com/news"

        NewsWorker.shared.getGameInformerNews(url: urlString) { (result: Result<NewsModel, Error>) in
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

     func fetchLogicForGameInformer(doc: Document) -> NewsModel? {

        let gameInformerNewsModel: NewsModel?

        do {
            let titles = try doc.getElementsByClass("field field--name-title field--type-string field--label-hidden")
            let times = try doc.getElementsByClass("field field--name-created field--type-created field--label-hidden")
         //   let imgURLS = try doc.select("img")
            let items = try doc.getElementsByClass("promo-img-thumb")

            do {
                var titlesArray = [String]()
                var timesArray = [String]()
                var imgURLSArray = [String]()
                var hrefsArray = [String]()

                for time in times {
                    timesArray.append(try time.text())
                }
                
                for img in items {
                    let tag = try img.select("a")
                    let url = try tag.select("img")
                    let fullImgUrl = "https://www.gameinformer.com/\(try url.attr("src"))"
                    imgURLSArray.append(fullImgUrl)
                }

                for title in titles {
                    titlesArray.append(try title.text())
                }
                
                
                for href in items {
                    let tag = try href.select("a")
                    hrefsArray.append(try tag.attr("href"))
                    
                }
                
                // drop first useless items
                imgURLSArray.removeFirst()
                hrefsArray.removeFirst()


                gameInformerNewsModel = NewsModel(titles: titlesArray,
                                             imgURLs: imgURLSArray,
                                             postTimes: timesArray,
                                             hrefURLs: hrefsArray,
                                             webPageLogo: "gameinformer_logo",
                                             webPageName: "Gameinformer",
                                             webPageURL: "https://www.gameinformer.com/")
                return gameInformerNewsModel
            } catch {
                print("error")
            }
         } catch {
            print("error")
        }
        return nil
    }

    private func splitAtFirst(str: String, delimiter: String) -> String? {
        guard let lowerIndex = (str.range(of: delimiter)?.lowerBound) else { return str }
        let firstPart: String = .init(str.prefix(upTo: lowerIndex))
        return firstPart
    }
}
