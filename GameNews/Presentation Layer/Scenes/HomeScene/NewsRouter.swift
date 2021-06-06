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
    func openSelectedNewsInWebView(articleURL: String)
    func openConfigureNewsViewController()
}

class NewsRouter {

    weak var viewController: UIViewController?
}

extension NewsRouter: NewsRoutingLogic {

    func openSelectedNewsInWebView(articleURL: String) {
        let defaultURL = "https://ign.com/"
        let selectedArticleURL = URL(string: defaultURL + articleURL) ?? URL(string: defaultURL)!
        let safariVC = SFSafariViewController(url: selectedArticleURL)

        viewController?.present(safariVC, animated: true)
    }

    func openConfigureNewsViewController() {
    }

}
