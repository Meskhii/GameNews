//
//  MainInteractor.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol MainBusinessLogic {
    func fetchUserDate()
}

class MainInteractor {
    // MARK: - External vars
    var presenter: MainPresentationLogic?
}

// MARK: - Business logic
extension MainInteractor: MainBusinessLogic {
    func fetchUserDate() {
        presenter?.presentData()
    }
}
