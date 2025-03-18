//
//  ViewModel.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 18/03/25.
//

import Foundation

class ViewModel {
    
    var email: String = ""
    var password: String = ""
    
    func saveUserData(email: String, password: String) {
        UserDefaultsManager.shared.saveUser(email: email, password: password)
    }
    
    func isValidLogin(email: String, password: String) -> Bool {
        let savedEmail = UserDefaultsManager.shared.getUserEmail()
        let savedPassword = UserDefaultsManager.shared.getUserPassword()
        
        return (email == savedEmail && password == savedPassword)
    }
}
