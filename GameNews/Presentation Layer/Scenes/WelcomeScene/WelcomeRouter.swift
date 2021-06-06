//
//  MainRouter.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation
import UIKit

protocol WelcomeRoutingLogic {
    func navigateToSignUp(vcId: String)
    func navigateToLogin(vcId: String)
}

class WelcomeRouter {

    weak var viewController: UIViewController?
}

extension WelcomeRouter: WelcomeRoutingLogic {

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
