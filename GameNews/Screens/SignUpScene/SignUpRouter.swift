//
//  SignUpRouter.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation
import UIKit

protocol SignUpRoutingLogic {
    func navigateToNews(vcId: String)
}

class SignUpRouter {

    weak var viewController: UIViewController?
}

// MARK: - Routing logic
extension SignUpRouter: SignUpRoutingLogic {

    func navigateToNews(vcId: String) {
        let storyboard = UIStoryboard(name: VCIds.newsVC, bundle: nil)
        guard let newsVC = storyboard.instantiateViewController(identifier: vcId) as? NewsViewController else {return}

        viewController?.navigationController?.pushViewController(newsVC, animated: true)
    }

}
