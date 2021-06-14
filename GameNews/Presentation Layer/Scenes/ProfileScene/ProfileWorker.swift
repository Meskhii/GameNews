//
//  ProfileWorker.swift
//  GameNews
//
//  Created by user200006 on 6/13/21.
//

import Foundation
import Firebase

class ProfileWorker {
    
    // MARK: - Sign Out Logic
    func signOut() -> Bool {
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUserSignedIn")
            return true
        } catch {
            return false
        }
        
    }
    
}
