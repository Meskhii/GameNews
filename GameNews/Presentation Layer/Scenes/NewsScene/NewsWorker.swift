//
//  NewsWorker.swift
//  GameNews
//
//  Created by Admin on 30.05.2021.
//

import Foundation
import SwiftSoup

class NewsWorker {

    static let shared = NewsWorker()

    func getIgnNews<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = URL(string: url) else {return}

        do {
            let htmlString = try String(contentsOf: url, encoding: .utf8)
            let htmlContent = htmlString

            do {
                let doc = try SwiftSoup.parse(htmlContent)
                let fetchData = fetchLogicForIgn(doc: doc)

                completion(.success(fetchData as! T)) // swiftlint:disable:this force_cast
            }
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func getGameInformerNews<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = URL(string: url) else {return}

        do {
            let htmlString = try String(contentsOf: url, encoding: .utf8)
            let htmlContent = htmlString

            do {
                let doc = try SwiftSoup.parse(htmlContent)
                let fetchData = fetchLogicForGameInformer(doc: doc)

                completion(.success(fetchData as! T)) // swiftlint:disable:this force_cast
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}

