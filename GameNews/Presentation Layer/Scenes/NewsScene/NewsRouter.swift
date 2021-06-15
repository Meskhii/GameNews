//
//  NewsRouter.swift
//  GameNews
//
//  Created by Admin on 30.05.2021.
//

import Foundation
import UIKit
import SafariServices

protocol NewsRoutingLogic {
    func openSelectedNewsInWebView(defaultURL: String, articleURL: String)
    func openConfigureNewsViewController(with webPages: [WebPagesModel])
    func presentShareSheetForNews(image: UIImage, url: URL)
}

class NewsRouter {
    // MARK: - Variables
    weak var viewController: UIViewController?
}

// MARK: - Routing Logic
extension NewsRouter: NewsRoutingLogic {

    func openSelectedNewsInWebView(defaultURL: String, articleURL: String) {
        let selectedArticleURL = URL(string: articleURL) ?? URL(string: defaultURL)!
        let safariVC = SFSafariViewController(url: selectedArticleURL)

        viewController?.present(safariVC, animated: true)
    }

    func openConfigureNewsViewController(with webPages: [WebPagesModel]) {
        let storyboard = UIStoryboard(name: "ConfigureNewsViewController", bundle: nil)
        let configureNewsVC = storyboard.instantiateViewController(withIdentifier: "ConfigureNewsViewController") as! ConfigureNewsViewController// swiftlint:disable:this force_cast
        configureNewsVC.delegate = viewController.self as? NewsDelegate
        configureNewsVC.webPageOptions = webPages
        viewController?.present(configureNewsVC, animated: true)
    }
    
    func presentShareSheetForNews(image: UIImage, url: URL) {
        
        let shareSheetVC = UIActivityViewController(
            activityItems:[
                image,
                url
            ],
            applicationActivities: nil)
        
        viewController?.present(shareSheetVC, animated: true)
    }

}
