//
//  IgnManager.swift
//  GameNews
//
//  Created by Admin on 05.06.2021.
//

import Foundation
import SwiftSoup

protocol IgnManagerProtocol {
    func fetchNews(completion: @escaping (NewsModel) -> Void)
}

class IgnManager: IgnManagerProtocol {
    func fetchNews(completion: @escaping (NewsModel) -> Void) {
        let urlString = "https://www.ign.com/pc?filter=articles"

        NewsWorker.shared.get(url: urlString) { (result: Result<NewsModel, Error>) in
            switch result {
            case .success(let news):
                completion(news)
            case .failure(let error):
                print(error)
            }
        }
    }

    static fileprivate func splitAtFirst(str: String, delimiter: String) -> String? {
        guard let lowerIndex = (str.range(of: delimiter)?.lowerBound) else { return str }
        let firstPart: String = .init(str.prefix(upTo: lowerIndex))
        return firstPart
    }

}

extension NewsWorker {

     func fetchLogic(doc: Document) -> NewsModel? {

        let ignNewsModel: NewsModel?

        do {
            let timeAgos = try doc.getElementsByClass("item-timeago")
            let imgURLS = try doc.select("img")
            let items = try doc.getElementsByClass("item-body")

            do {
                var titlesArray = [String]()
                var timeAgosArray = [String]()
                var imgURLSArray = [String]()
                var hrefsArray = [String]()

                for time in timeAgos {
                    timeAgosArray.append(try time.text())
                }

                for img in imgURLS {
                    let url = try img.attr("src")
                    let separatedByQuestionMark = IgnManager.splitAtFirst(str: url, delimiter: "?")
                    let parsed = separatedByQuestionMark?.replacingOccurrences(of: "_160w", with: "")
                    imgURLSArray.append(parsed ?? "")
                }

                for title in items {
                    titlesArray.append(try title.attr("aria-label"))
                }

                for href in items {
                    hrefsArray.append(try href.attr("href"))
                }

                // Removing extra fetched data
                timeAgosArray.removeSubrange(0...4)
                imgURLSArray.removeSubrange(0...2)

                ignNewsModel = NewsModel(titles: titlesArray,
                                             imgURLs: imgURLSArray,
                                             postTimes: timeAgosArray,
                                             hrefURLs: hrefsArray)
                return ignNewsModel
            } catch {
                print("error")
            }
         } catch {
            print("error")
        }
        return nil
    }
}
