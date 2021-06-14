//
//  BookmarksInteractor.swift
//  GameNews
//
//  Created by user200006 on 6/14/21.
//

import Foundation

protocol BookmarksBusinessLogic {
    func fetchBookmarkedNews()
}

class BookmarksInteractor {
    // MARK: - Variables
    var presenter: BookmarksPresentationLogic?
}
// MARK: - Business Logic
extension BookmarksInteractor: BookmarksBusinessLogic {
    func fetchBookmarkedNews() {
        
        var bookmarksDict = [[String : Any]]()
        let bookmarksWorker = BookmarksWorker()
        
        bookmarksWorker.fetchBookmarkedNews() { bookmarkedData in
            bookmarksDict = bookmarkedData
            DispatchQueue.main.async {
                self.presenter?.present(bookmarks: bookmarksDict)
            }
        }
        
    }
}
