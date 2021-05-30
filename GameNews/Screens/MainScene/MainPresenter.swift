//
//  MainPresenter.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    func presentData()
}

class MainPresenter {
    weak var viewController: MainDisplayLogic?
}

// MARK: - Presentation logic
extension MainPresenter: MainPresentationLogic {
    func presentData() {
    }
}
