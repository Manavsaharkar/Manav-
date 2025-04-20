//
//  Login Screen.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//

import Foundation
import SwiftUI

struct LoginScreenView: View {
    var body: some View {
        NavigationStack { // IMPORTANT: wrap inside NavigationStack
            
            VStack(spacing: 0) {
                // Top orange section with logo and text
                VStack(spacing: 16) {
                    Spacer().frame(height: 100)
                    
                    /*Image(systemName: "bag.fill")*/ // Replace with your custom logo
                    Image(systemName: "bag.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .padding(.bottom, 20) // Increase the value here to move it further down
                    
                    
                    Text("One app for food, dining, groceries\n& more in minutes!")
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    Image("food_banner") // <<< your real food image here
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.bottom, -20)
                }
                .frame(maxWidth: .infinity)
                //            .background(Color.orange)
                .background(Color(red: 0.8, green: 0.4, blue: 0.1)) // Custom dark orange
                
                
                // White background section
                VStack(spacing: 20) {
                    VStack(spacing: 8) {
                        Text("ACCOUNT")
                            .font(.headline)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Login/Create Account to manage orders")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    
//                    Button(action: {
//                        // Login action
//                    }) {
//                        Text("LOGIN")
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.orange)
//                            .cornerRadius(8)
//                    }
//                    .padding(.horizontal)
                    NavigationLink(destination: LoginView()) {
                        Text("LOGIN")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)

                    
                    //                Text("By clicking, I accept the Terms & Conditions and Privacy Policy")
                    //                    .font(.footnote)
                    //                    .foregroundColor(.gray)
                    //                    .multilineTextAlignment(.center)
                    //                    .padding(.horizontal)
                    
                    
                    Text("By clicking, I accept the ")
                        .font(.footnote)
                    + Text("Terms & Conditions").bold()
                        .font(.footnote)
                    + Text(" and ")
                        .font(.footnote)
                    + Text("Privacy Policy").bold()
                        .font(.footnote)
                    //                    .padding(.horizontal,10)
                    //                .multilineTextAlignment(.center)
                    
                    
                    Divider()
                    
                    VStack(spacing: 20) {
                        HStack {
                            
                            Image(systemName: "percent")
                            Text("Offers")
                            Spacer()
                            
                            
                            
                            NavigationLink(destination: OfferScreen()) {
                                      Image(systemName: "chevron.right")
                                  }
                            
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "envelope")
                            VStack(alignment: .leading) {
                                Text("Send Feedback")
                                Text("App version 4.78.2 (1377)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            NavigationLink(destination: SendFeedbackScreen()) {
                                Image(systemName: "chevron.right")
                            }

//                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 20)
                .background(Color.white)
                
                Spacer()
            }
            .background(Color.white)
            .ignoresSafeArea()
        }
    }
}
struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
