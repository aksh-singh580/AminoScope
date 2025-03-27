//
//  LauncherView.swift
//  AminoScope
//
//  Created by Prabhas Kumar on 17/12/24.
//

import SwiftUI

struct LauncherView: View {
    // Variable to track if user has seen the one time welcome introduciton.
    @AppStorage("newUser") private var newUser = false
    @State private var showWelcome = false
    
    var body: some View {
        Group {
            if showWelcome {
                WelcomeView()
            } else {
                ContentView()
            }
        }
        .onAppear() {
            if !newUser {
                showWelcome = true
                newUser = true
            }
        }
    }
}
