//
//  OptScreen.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//
//import SwiftUI
//
//struct OTPVerificationView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var otpDigits: [String] = Array(repeating: "", count: 6) // 6 digits OTP
//    @FocusState private var focusedField: Int?
//    @State private var timeRemaining = 30
//    @State private var timerStarted = false
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 20) {
//                
//                // Back button
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
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("VERIFY DETAILS")
//                        .font(.title3)
//                        .fontWeight(.bold)
//
//                    Text("OTP sent to +91-7775885345")
//                        .foregroundColor(.gray)
//                        .font(.subheadline)
//                }
//
//                Spacer().frame(height: 20)
//
//                Text("ENTER OTP")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//
//                // OTP Fields with underline
//                HStack(spacing: 15) {
//                    ForEach(0..<otpDigits.count, id: \.self) { index in
//                        VStack {
//                            TextField("", text: $otpDigits[index])
//                                .focused($focusedField, equals: index)
//                                .multilineTextAlignment(.center)
//                                .keyboardType(.numberPad)
//                                .frame(width: 40, height: 40)
//                                .onChange(of: otpDigits[index]) { newValue in
//                                    handleInputChange(newValue, at: index)
//                                }
//                                .onTapGesture {
//                                    focusedField = index
//                                }
//
//                            // Underline
//                            Rectangle()
//                                .frame(height: 2)
//                                .foregroundColor(focusedField == index ? Color.orange : Color.gray.opacity(0.5))
//                        }
//                    }
//                }
//                .padding(.top, 10)
//
//                // Timer Text
//                Text("Didn't receive the OTP? Retry in 00:\(String(format: "%02d", timeRemaining))")
//                    .foregroundColor(.gray)
//                    .font(.footnote)
//
//                // Enter OTP Button
//                Button(action: {
//                    if !timerStarted {
//                        timerStarted = true
//                        startTimer()
//                    }
//                    // Enter OTP Action
//                }) {
//                    Text("ENTER OTP")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color(red: 1.20, green: 0.7, blue: 0.49)) // Darker shade
//                        .cornerRadius(8)
//
//                        .cornerRadius(8)
//                }
//                .disabled(timerStarted)
//
//                Spacer()
//            }
//            .padding()
//        }
//    }
//
//    // MARK: - Timer Function
//    func startTimer() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            if timeRemaining > 0 {
//                timeRemaining -= 1
//            } else {
//                timer.invalidate()
//            }
//        }
//    }
//
//    // MARK: - Handle OTP Input
//    private func handleInputChange(_ newValue: String, at index: Int) {
//        if newValue.count > 1 {
//            otpDigits[index] = String(newValue.prefix(1))
//        }
//        
//        if !newValue.isEmpty {
//            if index < otpDigits.count - 1 {
//                focusedField = index + 1
//            } else {
//                focusedField = nil
//            }
//        } else {
//            if index > 0 {
//                focusedField = index - 1
//            }
//        }
//    }
//}
//
//struct OTPVerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OTPVerificationView()
//    }
//}
//
//
//




import SwiftUI

struct OTPVerificationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var otpDigits: [String] = Array(repeating: "", count: 6) // 6 digits OTP
    @FocusState private var focusedField: Int?
    @State private var timeRemaining = 30
    @State private var timerStarted = false
    @State private var showAlert = false // For showing the alert

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Back button
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }

                // Heading
                VStack(alignment: .leading, spacing: 4) {
                    Text("VERIFY DETAILS")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("OTP sent to +91-7775885345")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }

                Spacer().frame(height: 20)

                Text("ENTER OTP")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // OTP Fields with underline
                HStack(spacing: 15) {
                    ForEach(0..<otpDigits.count, id: \.self) { index in
                        VStack {
                            TextField("", text: $otpDigits[index])
                                .focused($focusedField, equals: index)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .frame(width: 40, height: 40)
                                .onChange(of: otpDigits[index]) { newValue in
                                    handleInputChange(newValue, at: index)
                                }
                                .onTapGesture {
                                    focusedField = index
                                }

                            // Underline
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(focusedField == index ? Color.orange : Color.gray.opacity(0.5))
                        }
                    }
                }
                .padding(.top, 10)

                // Timer Text
                Text("Didn't receive the OTP? Retry in 00:\(String(format: "%02d", timeRemaining))")
                    .foregroundColor(.gray)
                    .font(.footnote)

                // Enter OTP Button
                Button(action: {
                    if !timerStarted {
                        timerStarted = true
                        startTimer()
                    }
                    validateOTP() // Check if all OTP fields are filled
                }) {
                    Text("ENTER OTP")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 1.0, green: 0.78, blue: 0.69))
                        .cornerRadius(8)
                }
                .disabled(timerStarted)

                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Incomplete OTP"),
                    message: Text("Please enter the full 6-digit OTP."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    // MARK: - Timer Function
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
            }
        }
    }

    // MARK: - Handle OTP Input
    private func handleInputChange(_ newValue: String, at index: Int) {
        if newValue.count > 1 {
            otpDigits[index] = String(newValue.prefix(1))
        }
        
        if !newValue.isEmpty {
            if index < otpDigits.count - 1 {
                focusedField = index + 1
            } else {
                focusedField = nil
            }
        } else {
            if index > 0 {
                focusedField = index - 1
            }
        }
    }

    // MARK: - OTP Validation
    private func validateOTP() {
        // Check if all OTP digits are filled
        if otpDigits.contains("") {
            showAlert = true // Show alert if OTP is incomplete
        } else {
            // Proceed with OTP verification (add your logic here)
            print("OTP entered: \(otpDigits.joined())")
        }
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}



//import SwiftUI
//
//struct OTPVerificationView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var otp: [String] = Array(repeating: "", count: 6)
//    @State private var timeRemaining = 21
//    @State private var timerStarted = false
//    @FocusState private var focusedField: Int?
//    @State private var otpDigits: [String] = Array(repeating: "", count: 6) // 6 digits OTP
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 20) {
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
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("VERIFY DETAILS")
//                        .font(.title3)
//                        .fontWeight(.bold)
//
//                    Text("OTP sent to +91-7775885345")
//                        .foregroundColor(.gray)
//                        .font(.subheadline)
//                }
//
//                Spacer().frame(height: 20)
//
//                Text("ENTER OTP")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//
//                // OTP Fields
//                HStack(spacing: 15) {
//                    ForEach(0..<otpDigits.count, id: \.self) { index in
//                        TextField("", text: $otpDigits[index])
//                            .focused($focusedField, equals: index)
//                            .multilineTextAlignment(.center)
//                            .frame(width: 50, height: 50)
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            .keyboardType(.numberPad)
//                            .onChange(of: otpDigits[index]) { newValue in
//                                handleInputChange(newValue, at: index)
//                            }
//                            .onTapGesture {
//                                focusedField = index
//                            }
//                    }
//                }
//
//                Text("Didn't receive the OTP? Retry in 00:\(String(format: "%02d", timeRemaining))")
//                    .foregroundColor(.gray)
//                    .font(.footnote)
//
//                Button(action: {
//                    if !timerStarted {
//                        timerStarted = true
//                        startTimer()
//                    }
//                    // Enter OTP Action
//                }) {
//                    Text("ENTER OTP")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color(red: 1.0, green: 0.78, blue: 0.69))
//                        .cornerRadius(8)
//                }
//                .disabled(timerStarted)
//
//                Spacer()
//            }
//            .padding()
//        }
//    }
//
//    // Timer function
//    func startTimer() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            if timeRemaining > 0 {
//                timeRemaining -= 1
//            } else {
//                timer.invalidate()
//            }
//        }
//    }
//
//    // 🛠 Handle OTP Input function
//    private func handleInputChange(_ newValue: String, at index: Int) {
//        // Allow only one character
//        if newValue.count > 1 {
//            otpDigits[index] = String(newValue.prefix(1))
//        }
//
//        // Move to next field if a digit is entered
//        if !newValue.isEmpty {
//            if index < otpDigits.count - 1 {
//                focusedField = index + 1
//            } else {
//                focusedField = nil // Hide keyboard after last digit
//            }
//        }
//        // Move to previous field if deleted
//        else {
//            if index > 0 {
//                focusedField = index - 1
//            }
//        }
//    }
//}
//
//struct OTPVerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OTPVerificationView()
//    }
//}
//
//
