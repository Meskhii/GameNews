//
//  BookmarksWorker.swift
//  GameNews
//
//  Created by user200006 on 6/14/21.
//

import UIKit
import Firebase

class BookmarksWorker {
    // MARK: - Bookmark News
    func fetchBookmarkedNews(completion: @escaping ([[String : Any]]) -> Void) {
        let database = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        var documentData = [[String : Any]]()
        
        database.collection("users").document(uid!).collection("bookmarks").getDocuments { snapshot, error in
            
            if error == nil && snapshot != nil {
        
                for document in snapshot!.documents {
                    documentData.append(document.data())
                }
                completion(documentData)
            }
        }
        
    }
}
