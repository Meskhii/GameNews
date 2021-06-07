//
//  SteamNewsRouter.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import Foundation
import UIKit

protocol SteamSearchGameRoutingLogic {
    func navigateToSelectedGameNews()
}

class SteamSearchGameRouter {

    weak var viewController: UIViewController?
}

extension SteamSearchGameRouter: SteamSearchGameRoutingLogic {

    func navigateToSelectedGameNews() {
        let storyboard = UIStoryboard(name: VCIds.selectedGameNewsVC, bundle: nil)
        guard let selectedGameNewsVC = storyboard.instantiateViewController(identifier: VCIds.selectedGameNewsVC) as? SelectedGameNewsViewController else {return}

        viewController?.navigationController?.pushViewController(selectedGameNewsVC, animated: true)
    }

}
