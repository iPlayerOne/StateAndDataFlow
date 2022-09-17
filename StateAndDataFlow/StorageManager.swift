//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by ikorobov on 17.09.2022.
//

import SwiftUI

class StorageManager: ObservableObject {
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    @AppStorage ("user") private var currentUser: Data?
    
    private init() {}
    
    func save(user: User) {
        currentUser = try? JSONEncoder().encode(user)
    }
    
//    func fetchUser() -> User {
//        guard
//            let user = try? JSONDecoder().decode(User.self, from: currentUser ?? )
//        else {
//            return User()
//        }
//        return user
//    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
    }
    
}
