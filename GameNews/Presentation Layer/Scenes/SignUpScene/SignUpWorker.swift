//
//  SignUpWorker.swift
//  GameNews
//
//  Created by Admin on 16.05.2021.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class SignUpWorker {

    func signUpUser(firstName: String, lastName: String, email: String, password: String) -> Bool {

        var signUpSucceed = true

        Auth.auth().createUser(withEmail: email, password: password) { (result, signUpError) in
            if signUpError != nil {
                signUpSucceed = false
            } else {
                let database = Firestore.firestore()
                database.collection("users").addDocument(data: ["firstname": firstName,
                                                                "lastname": lastName,
                                                                "uid": result!.user.uid]) { (error) in
                    if error != nil {
                        signUpSucceed = false
                    }
                }
            }
        }
        return signUpSucceed
    }
}
