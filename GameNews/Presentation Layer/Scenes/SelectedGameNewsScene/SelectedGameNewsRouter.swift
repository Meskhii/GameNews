//
//  SelectedGameNewsRouter.swift
//  GameNews
//
//  Created by Admin on 08.06.2021.
//

import UIKit
import SafariServices

protocol SelectedGameNewsRoutingLogic {
    func openSelectedGameNewsInSafariView(using url: String)
}

class SelectedGameNewsRouter {
    // MARK: - Variables
    weak var viewController: UIViewController?
}
// MARK: - Routing Logic
extension SelectedGameNewsRouter: SelectedGameNewsRoutingLogic {

    func openSelectedGameNewsInSafariView(using url: String) {
        let defaultURL = "https://store.steampowered.com/news/"
        let selectedArticleURL = URL(string: url) ?? URL(string: defaultURL)!
        let safariVC = SFSafariViewController(url: selectedArticleURL)

        viewController?.present(safariVC, animated: true)
    }

}
