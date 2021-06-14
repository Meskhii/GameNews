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
    // MARK: - Fetch News
    func fetchNews(completion: @escaping (NewsModel) -> Void) {
        let urlString = "https://www.ign.com/pc?filter=articles"

        NewsWorker.shared.getIgnNews(url: urlString) { (result: Result<NewsModel, Error>) in
            switch result {
            case .success(let news):
                completion(news)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Fetch Logic
extension NewsWorker {

     func fetchLogicForIgn(doc: Document) -> NewsModel? {

        let ignNewsModel: NewsModel?

        // MARK: - Setup HTML Tags
        do {
            let timeAgos = try doc.getElementsByClass("item-timeago")
            let imgURLS = try doc.select("img")
            let items = try doc.getElementsByClass("item-body")

            // MARK: - Try Web Scraping
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
                    let separatedByQuestionMark = splitAtFirst(str: url, delimiter: "?")
                    let parsed = separatedByQuestionMark?.replacingOccurrences(of: "_160w", with: "")
                    imgURLSArray.append(parsed ?? "")
                }

                for title in items {
                    titlesArray.append(try title.attr("aria-label"))
                }

                for href in items {
                    hrefsArray.append(try href.attr("href"))
                }
                
                // MARK: - Prepare Parsed Data

                // Removing extra fetched data
                timeAgosArray.removeSubrange(0...4)
                imgURLSArray.removeSubrange(0...2)

                ignNewsModel = NewsModel(titles: titlesArray,
                                             imgURLs: imgURLSArray,
                                             postTimes: timeAgosArray,
                                             hrefURLs: hrefsArray,
                                             webPageLogo: "ign_logo",
                                             webPageName: "IGN News",
                                             webPageURL: "https://www.ign.com/")
                return ignNewsModel
            } catch {
                print("error")
            }
         } catch {
            print("error")
        }
        return nil
    }

    // MARK: - Helper Function
    private func splitAtFirst(str: String, delimiter: String) -> String? {
        guard let lowerIndex = (str.range(of: delimiter)?.lowerBound) else { return str }
        let firstPart: String = .init(str.prefix(upTo: lowerIndex))
        return firstPart
    }
}

