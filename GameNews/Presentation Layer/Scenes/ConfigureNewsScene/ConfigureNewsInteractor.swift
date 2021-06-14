//
//  ConfigureNewsInteractor.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import Foundation

protocol ConfigureNewsBusinessLogic {
    func fetchWebPagesOptions()
}

class ConfigureNewsInteractor {
    // MARK: - Variables
    var presenter: ConfigureNewsPresentationLogic?
}

// MARK: - Business Logic
extension ConfigureNewsInteractor: ConfigureNewsBusinessLogic {
    func fetchWebPagesOptions() {
        var worker: ConfigureNewsWorker?
        var webPageOptions = [WebPagesModel]()

        worker = ConfigureNewsWorker()

        webPageOptions = worker?.mockFetchedWebPages() ?? []

        presenter?.presentWebPages(data: webPageOptions)
    }
}
