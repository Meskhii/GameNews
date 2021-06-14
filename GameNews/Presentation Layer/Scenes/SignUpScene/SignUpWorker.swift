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

    // MARK: - Sign Up LogicS
    func signUpUser(firstName: String, lastName: String, email: String, password: String) -> Bool {

        var signUpSucceed = true
        

        Auth.auth().createUser(withEmail: email, password: password) { (result, signUpError) in
            if signUpError != nil {
                signUpSucceed = false
            } else {
                let database = Firestore.firestore()
                let uid = Auth.auth().currentUser?.uid
                
                database.collection("users").document(uid!).setData([ "firstname": firstName,
                                                                      "lastname": lastName ], merge: true)

            }
        }
        return signUpSucceed
    }
}
