//
//  UserDefaultsManager.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 18/03/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let userEmailKey = "userEmailKey"
        static let userPasswordKey = "userPasswordKey"
        static let isLoggedIn = "isLoggedIn"
        
    }
    
    // MARK: - Save Data
    func saveUser(email: String, password: String) {
        defaults.set(email, forKey: Keys.userEmailKey)
        print("✅ Email Saved: \(email)")
        defaults.set(password, forKey: Keys.userPasswordKey)
        print("✅ Password Saved: \(password)")
        defaults.set(true, forKey: Keys.isLoggedIn)
    }
    
    // MARK: - Retrieve Data
    func getUserEmail() -> String? {
        let email = defaults.string(forKey: Keys.userEmailKey) ?? ""
        print("📩 Retrieved Email: \(email)")
        return email
    }
    
    func getUserPassword() -> String? {
        let password = defaults.string(forKey: Keys.userPasswordKey) ?? ""
        print("🔑 Retrieved Password: \(password)")
        return password
    }
    
    func getLoginStatus() -> Bool {
        let status = defaults.bool(forKey: Keys.isLoggedIn)
        print("🟢 isLoggedIn Status: \(status)")
        return status
    }
    
    // MARK: - Clear Data (For Logout)
    func clearUserData() {
        defaults.removeObject(forKey: Keys.userEmailKey)
        defaults.removeObject(forKey: Keys.userPasswordKey)
        defaults.set(false, forKey: Keys.isLoggedIn)  // Logout Success
    }
}
