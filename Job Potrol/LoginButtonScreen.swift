//
//  LoginButtonScreen.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//

//
//import SwiftUI
//struct LoginView: View {
//    
//    @State private var mobileNumber: String = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 20) {
//                
//                // Title
//                Text("LOGIN")
//                    .font(.title)
//                    .fontWeight(.bold)
//                
//                // Subtitle
//                Text("Enter your phone number to proceed")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                
//                // Mobile Number Field with Country Picker
//                HStack {
//                    // Flag and Code
//                    HStack(spacing: 4) {
//                        Text("🇮🇳") // Indian Flag Emoji
//                            .font(.system(size: 24))
//                        
//                        Text("+91")
//                            .font(.body)
//                        
//                        Image(systemName: "chevron.down")
//                            .font(.caption)
//                    }
//                    .padding(.leading, 8)
//                    
//                    Divider()
//                        .frame(height: 24)
//                    
//                    // Mobile Number Field
//                    TextField("Mobile number", text: $mobileNumber)
//                        .keyboardType(.numberPad)
//                        .padding(.leading, 8)
//                }
//                .padding()
//                .overlay(
//                    Rectangle()
//                        .frame(height: 1)
//                        .foregroundColor(.gray.opacity(0.3))
//                        .padding(.top, 48)
//                    , alignment: .top
//                )
//                
//                
//           
//                
//                
//                
//                // Continue Button with NavigationLink
//                NavigationLink(destination: OTPVerificationView()) {
//                    Text("CONTINUE")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color(red: 1.0, green: 0.78, blue: 0.69)) // Light peach color
//                        .cornerRadius(8)
//                }
//                .padding(.top, 20)
//                
//                // Terms & Conditions Text
//                Text("By clicking, I accept the ")
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//                + Text("Terms & Conditions")
//                    .font(.footnote)
//                    .bold()
//                + Text(" and ")
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//                + Text("Privacy Policy")
//                    .font(.footnote)
//                    .bold()
//                
//                Spacer()
//            }
//            .padding()
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

import SwiftUI
struct LoginView: View {
    
    @State private var mobileNumber: String = ""
    @State private var isMobileNumberValid: Bool = true  // Track validation status
    @State private var showErrorMessage: Bool = false    // Show error message when validation fails
    @State private var navigateToOTP = false // Control navigation manually
    @State private var showAlert = false // Show alert for invalid mobile number
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Title
                Text("LOGIN")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Subtitle
                Text("Enter your phone number to proceed")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Mobile Number Field with Country Picker
                HStack {
                    // Flag and Code
                    HStack(spacing: 4) {
                        Text("🇮🇳") // Indian Flag Emoji
                            .font(.system(size: 24))
                        
                        Text("+91")
                            .font(.body)
                        
                        Image(systemName: "chevron.down")
                            .font(.caption)
                    }
                    .padding(.leading, 8)
                    
                    Divider()
                        .frame(height: 24)
                    
                    // Mobile Number Field
                    TextField("Mobile number", text: $mobileNumber)
                        .keyboardType(.numberPad)
                        .padding(.leading, 8)
                }
                .padding()
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                        .padding(.top, 48)
                    , alignment: .top
                )
                
                // Continue Button
                Button(action: {
                    validateMobileNumber()
                    if isMobileNumberValid {
                        navigateToOTP = true // Proceed to next screen if valid
                    } else {
                        showAlert = true // Show alert if invalid
                    }
                }) {
                    Text("CONTINUE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 1.0, green: 0.78, blue: 0.69)) // Light peach color
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
                // Terms & Conditions Text
                Text("By clicking, I accept the ")
                    .font(.footnote)
                    .foregroundColor(.gray)
                + Text("Terms & Conditions")
                    .font(.footnote)
                    .bold()
                + Text(" and ")
                    .font(.footnote)
                    .foregroundColor(.gray)
                + Text("Privacy Policy")
                    .font(.footnote)
                    .bold()
                
                Spacer()
            }
            .padding()
            .background(
                NavigationLink(destination: OTPVerificationView(), isActive: $navigateToOTP) {
                    EmptyView()
                }
                .hidden()
            )
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid Phone Number"),
                    message: Text("Please enter a valid 10-digit mobile number."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    // Mobile number validation function
    private func validateMobileNumber() {
        let cleanNumber = mobileNumber.filter { $0.isNumber }
        if cleanNumber.count == 10 {
            isMobileNumberValid = true
            showErrorMessage = false
        } else {
            isMobileNumberValid = false
            showErrorMessage = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
