//
//  BookmarksPresenter.swift
//  GameNews
//
//  Created by user200006 on 6/14/21.
//

import Foundation

protocol BookmarksPresentationLogic {
    func present(bookmarks: [[String : Any]])
}

class BookmarksPresenter {
    // MARK: - Variables
    weak var bookmarksViewController: BookmarksDisplayLogic?
}

// MARK: - Presentation logic
extension BookmarksPresenter: BookmarksPresentationLogic {
    func present(bookmarks: [[String : Any]]) {
        var bookmarksModel = [BookmarksModel]()
        
        for bookmark in bookmarks {
            bookmarksModel.append(BookmarksModel(newsImage: bookmark["news_image"] as! String,
                                                 newsTitle: bookmark["news_title"] as! String,
                                                 newsUrl: bookmark["news_url"] as! String))
        }
        bookmarksViewController?.displayBookmarks(data: bookmarksModel)
    }
}
