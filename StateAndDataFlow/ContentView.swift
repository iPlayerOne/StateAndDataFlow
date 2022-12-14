//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            VStack {
                Spacer()
                
                ButtonView(
                    title: timer.buttonTitle,
                    color: .red,
                    action: timer.startTimer
                )
                
                Spacer()
                
                ButtonView(title: "LogOut", color: .blue) {
                    DataManager.shared.clear(userManager: user)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


