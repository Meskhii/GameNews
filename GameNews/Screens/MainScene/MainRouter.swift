//
//  MainRouter.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation
import UIKit

protocol MainRoutingLogic {
    func navigateToSignUp(vcId: String)
    func navigateToLogin(vcId: String)
    func navigateToNews(vcId: String)
}

class MainRouter {

    weak var viewController: UIViewController?
}

extension MainRouter: MainRoutingLogic {

    func navigateToNews(vcId: String) {
        let storyboard = UIStoryboard(name: VCIds.newsVC, bundle: nil)
        guard let newsVC = storyboard.instantiateViewController(identifier: vcId) as? NewsViewController else {return}

        viewController?.navigationController?.pushViewController(newsVC, animated: true)
    }

    func navigateToSignUp(vcId: String) {
        let storyboard = UIStoryboard(name: VCIds.signUpVC, bundle: nil)
        guard let signUpVC = storyboard.instantiateViewController(identifier: vcId) as? SignUpViewController else {return}

        viewController?.navigationController?.pushViewController(signUpVC, animated: true)
    }

    func navigateToLogin(vcId: String) {
        let storyboard = UIStoryboard(name: VCIds.loginVC, bundle: nil)
        guard let loginVC = storyboard.instantiateViewController(identifier: vcId) as? LoginViewController else {return}

        viewController?.navigationController?.pushViewController(loginVC, animated: true)
    }

}
