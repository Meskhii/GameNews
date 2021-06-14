//
//  LoginInteractor.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol LoginBusinessLogic {
    func fetchUser(request: Login.Request)
}

class LoginInteractor {
    // MARK: - Variables
    var presenter: LoginPresentationLogic?
}

// MARK: - Business logic
extension LoginInteractor: LoginBusinessLogic {
    func fetchUser(request: Login.Request) {
        let email = request.email
        let password = request.password
        let loginWorker = LoginWorker()
        if loginWorker.login(email: email!, password: password!) {
            let response = Login.Response(success: true)
            presenter?.presentUser(response: response)
        } else {
            let response = Login.Response(success: false)
            presenter?.presentUser(response: response)
        }
    }
}
