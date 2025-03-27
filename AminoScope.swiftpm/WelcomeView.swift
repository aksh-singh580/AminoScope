//
//  WelcomeView.swift
//  AminoScope
//
//  Created by Prabhas Kumar on 17/12/24.
//  Edited by Aksh Singh, Prabhas Kumar
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var scene = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("Hello")
                    .font(.largeTitle)
                    .opacity(
                        scene == 0 ? 1 : 0
                    )
                    .animation(.easeOut(duration: 0.8), value: scene)
                
                
                Text("Welcome to AminoScope")
                    .font(.largeTitle)
                    .opacity(
                        scene == 2 ? 1 : 0
                    )
                    .animation(.easeInOut(duration: 0.8), value: scene)
                
                
                VStack {
                    
                    Spacer().frame(height: 100)
                    
                    Text("Your gateway to protein exploration")
                        .font(.largeTitle)
                        .opacity(scene >= 4 ? 1 : 0)
                        .animation(.easeInOut(duration: 0.8), value: scene)
                    
                    Spacer().frame(height: 50)
                    
                    
                    NavigationLink{
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Let’s Get Started")
                            .font(.title2)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .fill(Color.primary)
                            )
                            .foregroundStyle(
                                colorScheme == .dark ? .black : .white
                            )
                            .opacity(scene == 6 ? 1 : 0)
                            .animation(.easeIn(duration: 0.8), value: scene)
                        
                    }
                }
                .opacity(scene >= 4 ? 1 : 0)
                
            }
            .onAppear {
                startFadeAnimation()
            }
        }
    }
    
    func startFadeAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) {
            scene = 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                scene = 2
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) {
                    scene = 3
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                        scene = 4
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) {
                            scene = 5
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                scene = 6
                            }
                        }
                    }
                }
            }
        }
    }
}
