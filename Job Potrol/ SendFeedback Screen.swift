//
//   SendFeedback Screen.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//

import Foundation
import SwiftUI

struct SendFeedbackScreen: View {
    @State private var name: String = ""
    @State private var feedback: String = ""
    @State private var rating: Int = 0
    @State private var showThankYou = false

    var body: some View {
        VStack(spacing: 20) {
            
            // Title
            Text("Send Feedback")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)
            
            // Name Field
            TextField("Your Name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom,20)
            
            // Feedback Field
            TextEditor(text: $feedback)
                .frame(height: 150)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .overlay(
                    VStack {
                        if feedback.isEmpty {
                            HStack {
                                Text("Write your feedback here...")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 30)
                                    .padding(.top, -18)
                                   
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                )
            
            // Star Rating
            VStack(spacing: 8) {
                Text("Rate Us")
                    .font(.headline)
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= rating ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.orange)
                            .onTapGesture {
                                rating = index
                            }
                            .animation(.easeInOut, value: rating)
                    }
                }
            }
            
            // Send Button
            Button(action: {
                showThankYou = true
                clearFields()
            }) {
                Text("Send Feedback")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground))
        .alert(isPresented: $showThankYou) {
            Alert(title: Text("Thank You!"), message: Text("Your feedback has been sent."), dismissButton: .default(Text("OK")))
        }
    }
    
    // Helper to clear fields after sending
    func clearFields() {
        name = ""
        feedback = ""
        rating = 0
    }
}

struct SendFeedbackScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SendFeedbackScreen()
        }
    }
}

