//
//  ProfilePresenter.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import Foundation

protocol ProfilePresentationLogic {
    func showSignOutError()
}

class ProfilePresenter {
    // MARK: - Variables
    weak var profileViewController: ProfileDisplayLogic?
}
// MARK: - Presentation Logic
extension ProfilePresenter: ProfilePresentationLogic {
    func showSignOutError() {
        profileViewController?.displaySignOutError()
    }
}
