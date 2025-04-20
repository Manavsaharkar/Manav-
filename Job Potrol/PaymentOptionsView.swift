//
//  PaymentOptionsView.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

//import Foundation
//import SwiftUI
//
//struct PaymentOptionsView: View {
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 30) {
//                
//                // Back Button
//                HStack {
//                    Button(action: {
//                        dismiss()
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.title2)
//                            .foregroundColor(.black)
//                    }
//                    Spacer()
//                }
//                
//                // Heading
//                VStack(spacing: 8) {
//                    Text("Select Payment Method")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                    
//                    Text("Choose your preferred way to pay")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                .padding(.top, 20)
//                
//                Spacer()
//                
//                // Payment Options
//                VStack(spacing: 20) {
//                    PaymentOptionButton(title: "Google Pay", color: Color.blue.opacity(0.8), imageName: "gpay_logo")
//                    
//                    PaymentOptionButton(title: "Paytm", color: Color.blue, imageName: "paytm_logo")
//                    
//                    PaymentOptionButton(title: "PhonePe", color: Color.purple, imageName: "phonepe_logo")
//                    
//                    PaymentOptionButton(title: "Debit Card", color: Color.green, imageName: "creditcard.fill")
//                }
//                
//                Spacer()
//            }
//            .padding()
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct PaymentOptionButton: View {
//    var title: String
//    var color: Color
//    var imageName: String
//    
//    var body: some View {
//        Button(action: {
//            // Handle Payment Action
//            print("\(title) selected")
//        }) {
//            HStack {
//                if imageName.contains("fill") {
//                    Image(systemName: imageName)
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .padding(.trailing, 10)
//                } else {
//                    Image(imageName)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 30, height: 30)
//                        .padding(.trailing, 10)
//                }
//                
//                Text(title)
//                    .font(.headline)
//                    .foregroundColor(.white)
//                
//                Spacer()
//            }
//            .padding()
//            .frame(height: 60)
//            .background(color)
//            .cornerRadius(12)
//            .shadow(color: color.opacity(0.4), radius: 8, x: 0, y: 5)
//        }
//    }
//}
//
//struct PaymentOptionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaymentOptionsView()
//    }
//}


import SwiftUI

struct PaymentOptionsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var animate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Back button
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2.bold())
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                        Spacer()
                    }
                    
                    Spacer().frame(height: 10)
                    
                    // Title
                    VStack(spacing: 6) {
                        Text("Select Payment Method")
                            .font(.largeTitle.bold())
                            .foregroundColor(.black)
                        
                        Text("Fast & Secure Payments")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer().frame(height: 30)
                    
                    // Payment Options
                    VStack(spacing: 25) {
                        PaymentOptionButton(title: "Google Pay", gradientColors: [Color.blue, Color.green], imageName: "gpay_logo", animate: $animate)
                        
                        PaymentOptionButton(title: "Paytm", gradientColors: [Color.blue.opacity(0.8), Color.cyan], imageName: "paytm_logo", animate: $animate)
                        
                        PaymentOptionButton(title: "PhonePe", gradientColors: [Color.purple, Color.pink], imageName: "phonepe_logo", animate: $animate)
                        
                        PaymentOptionButton(title: "Debit Card", gradientColors: [Color.green, Color.teal], systemImageName: "creditcard.fill", animate: $animate)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct PaymentOptionButton: View {
    var title: String
    var gradientColors: [Color]
    var imageName: String? = nil
    var systemImageName: String? = nil
    @Binding var animate: Bool
    
    var body: some View {
        Button(action: {
            // Handle action
            print("\(title) tapped!")
        }) {
            HStack(spacing: 15) {
                if let img = imageName {
                    Image(img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .scaleEffect(animate ? 1.05 : 0.95) // animate logo pulse
                        .rotationEffect(.degrees(animate ? 5 : -5)) // little tilt effect
                        .background(Color.white.opacity(0.5))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                } else if let systemImg = systemImageName {
                    Image(systemName: systemImg)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.white.opacity(0.2))
                        .clipShape(Circle())
                        .scaleEffect(animate ? 1.1 : 0.9)
                        .rotationEffect(.degrees(animate ? 8 : -8))
                }
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .frame(height: 65)
            .background(
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .shadow(color: gradientColors.first!.opacity(0.4), radius: 10, x: 0, y: 6)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
        }
        .scaleEffect(animate ? 1.01 : 1.0)
    }
}

struct PaymentOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentOptionsView()
    }
}
