//
//  SignUpInteractor.swift
//  GameNews
//
//  Created by Admin on 15.05.2021.
//

import Foundation

protocol SignUpBusinessLogic {
    func signUp(request: SignUp.Request)
}

class SignUpInteractor {
    // MARK: - External vars
    var presenter: SignUpPresentationLogic?
}

// MARK: - Business logic
extension SignUpInteractor: SignUpBusinessLogic {
    func signUp(request: SignUp.Request) {
        let firstName = request.firstName
        let lastName = request.lastName
        let email = request.email
        let password = request.password
        let signUpWorker = SignUpWorker()
        if signUpWorker.signUpUser(firstName: firstName!, lastName: lastName!, email: email!, password: password!) {
            let response = SignUp.Response(success: true)
            presenter?.presentSignUp(response: response)
        } else {
            let response = SignUp.Response(success: false)
            presenter?.presentSignUp(response: response)
        }
    }
}
