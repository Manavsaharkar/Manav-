//
//  Animation Swiggy.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

//import SwiftUI
//
//struct SplashScreenView: View {
//    @State private var animateLogo = false
//    @State private var moveUp = false
//    @State private var showMainView = false
//
//    var body: some View {
//        ZStack {
//            if showMainView {
//                MainView() // After splash, move to main app
//            } else {
//                Color.white
//                    .ignoresSafeArea()
//
//                VStack {
//                    Spacer()
//                    
//                    Image("Swiggy") // Replace with your logo name
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150, height: 150)
//                        .scaleEffect(animateLogo ? 1.0 : 0.5)
//                        .offset(y: moveUp ? -100 : 0)
//                        .opacity(animateLogo ? 1 : 0)
//                        .animation(.interpolatingSpring(stiffness: 70, damping: 8), value: animateLogo)
//                        .animation(.easeOut(duration: 1.0), value: moveUp)
//
//                    Spacer()
//                }
//                .onAppear {
//                    // 1st: Logo appears and bounces
//                    animateLogo = true
//                    
//                    // 2nd: After bounce, move up slightly
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                        moveUp = true
//                    }
//                    
//                    // 3rd: After everything, go to MainView
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                        withAnimation {
//                            showMainView = true
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct MainView: View {
//    var body: some View {
//        Text("Welcome to Main App!")
//            .font(.largeTitle)
//            .bold()
//            .padding()
//    }
//}
//
//#Preview {
//    SplashScreenView()
//}
