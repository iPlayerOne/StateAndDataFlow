//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by ikorobov on 17.09.2022.
//

import Foundation


class StorageManager: ObservableObject {
    
    let defaults = UserDefaults.standard
        
        func saveData(data: UserManager) {
            defaults.set(data.isRegister, forKey: "register")
            defaults.set(data.name, forKey: "username")
        }
        
        func fetchUser(data: UserManager) {
            data.isRegister = defaults.value(forKey: "register") as? Bool ?? false
            guard let value = defaults.value(forKey: "username") else {return}
            data.name = value as? String ?? ""
        }
    
}
