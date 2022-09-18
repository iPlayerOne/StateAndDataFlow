//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $user.name)
                    .multilineTextAlignment(.center)
                Text(user.name.count.formatted())
                    .padding(.trailing)
                    .foregroundColor(user.isValidName ? .green : .red)
                
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(!user.isValidName)
            }
        }
    }
    
    private func registerUser() {
        if !user.name.isEmpty {
            user.name = name
            user.isRegister.toggle()
            StorageManager.shared.save(user: name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
