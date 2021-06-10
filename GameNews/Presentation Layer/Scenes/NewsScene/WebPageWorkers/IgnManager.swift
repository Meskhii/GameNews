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
}
