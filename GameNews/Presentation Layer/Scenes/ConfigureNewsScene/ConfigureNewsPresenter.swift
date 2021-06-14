//
//  ConfigureNewsPresenter.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import Foundation

protocol ConfigureNewsPresentationLogic {
    func presentWebPages(data: [WebPagesModel])
}

class ConfigureNewsPresenter {
    // MARK: - Variables
    weak var configureNewsViewController: ConfigureNewsDisplayLogic?
}
// MARK: - Presentation Logic
extension ConfigureNewsPresenter: ConfigureNewsPresentationLogic {
    func presentWebPages(data: [WebPagesModel]) {
        configureNewsViewController?.displayWebPageOptions(data: data)
    }
}
