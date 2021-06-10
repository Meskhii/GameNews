//
//  ConfigureNewsRouter.swift
//  GameNews
//
//  Created by Admin on 10.06.2021.
//

import UIKit

protocol ConfigureNewsRoutingLogic {
    func navigateBackToNewsScene()
}

class ConfigureNewsRouter {
    weak var viewController: UIViewController?
}

extension ConfigureNewsRouter: ConfigureNewsRoutingLogic {
    func navigateBackToNewsScene() {
        
    }
}
