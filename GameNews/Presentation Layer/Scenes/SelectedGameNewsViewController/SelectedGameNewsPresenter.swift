//
//  SelectedGameNewsPresenter.swift
//  GameNews
//
//  Created by Admin on 07.06.2021.
//

import Foundation

protocol SelectedGameNewsPresentationLogic: AnyObject {
    func present(data: [GameNewsModel])
}

class SelectedGameNewsPresenter {
    weak var selectedGameNewsViewController: SelectedGameNewsDisplayLogic?
}

// MARK: - Presentation logic
extension SelectedGameNewsPresenter: SelectedGameNewsPresentationLogic {
    func present(data: [GameNewsModel]) {
        selectedGameNewsViewController?.display(data: data)
    }
}
