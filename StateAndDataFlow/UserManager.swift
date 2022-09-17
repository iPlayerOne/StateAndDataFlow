//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var user = User()
    var isValidName: Bool {
        user.name.count >= 3
    }
    init(){}
    init (user: User) {
        self.user = user
    }
    
}

struct User: Codable {
    var name = ""
    var isRegister = false
}
