//
//  LoginWorker.swift
//  GameNews
//
//  Created by Admin on 17.05.2021.
//

import Foundation

import Firebase
import FirebaseFirestore
import FirebaseAuth

class LoginWorker {

    func login(email: String, password: String) -> Bool {

        var loginSucceed = true

        Auth.auth().signIn(withEmail: email, password: password) { (_, err) in
            if err != nil {
                loginSucceed = false
            }
        }
        return loginSucceed
    }
}
