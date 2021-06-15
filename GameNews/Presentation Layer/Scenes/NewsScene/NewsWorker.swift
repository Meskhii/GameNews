//
//  NewsWorker.swift
//  GameNews
//
//  Created by Admin on 30.05.2021.
//

import Foundation
import SwiftSoup
import Firebase

class NewsWorker {

    static let shared = NewsWorker()
    
    // MARK: - Bookmark News
    func bookmarkNewsInFirebase(title: String, image: String, newsUrl: String) {
        let database = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        
        database.collection("users").document(uid!).collection("bookmarks").document(title).setData(["news_title" : title, "news_image" : image, "news_url" : newsUrl])
        
    }
    
    // MARK: - Delete Bookmarked News
    func deleteNewsForUserFromFirebase(title: String) {
        let database = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        
        database.collection("users").document(uid!).collection("bookmarks").document(title).delete()
    }
    
    // MARK: - Check If News Bookmarked
    func checkIfNewsBookmarked(title: String, completion: @escaping (Bool) -> Void) {
        let database = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
                
        database.collection("users").document(uid!).collection("bookmarks").document(title).getDocument { document, error in
                if error == nil {
                    if document != nil && document!.exists {
                        completion(true)
                    } else {
                        completion(false)
                    }
                } else {
                    completion(false)
                }
        }
            
    }

    // MARK: - IGN Worker
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
    
    // MARK: - Game Informer Worker
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
    
    // MARK: - Gamespot Worker
    func getGamespotNews<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = URL(string: url) else {return}

        do {
            let htmlString = try String(contentsOf: url, encoding: .utf8)
            let htmlContent = htmlString

            do {
                let doc = try SwiftSoup.parse(htmlContent)
                let fetchData = fetchLogicForGamespot(doc: doc)

                completion(.success(fetchData as! T)) // swiftlint:disable:this force_cast
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}

