//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by ikorobov on 17.09.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    private let userKey = "userName"
    
    private init() {}
    
    func save(user: String) {
        defaults.set(user, forKey: userKey)
    }
    
    func fetchUser() -> String {
        if let userName = defaults.string(forKey: userKey) {
            return userName
        }
        return ""
    }
    
    func deleteUser() {
        defaults.removeObject(forKey: userKey)
    }
    
    func isRegister() -> Bool {
        if !fetchUser().isEmpty {
            return true
        }
        return false
    }
    
}
