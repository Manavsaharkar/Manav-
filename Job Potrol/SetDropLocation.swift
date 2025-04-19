//
//  SetDropLocation.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//
//
//import Foundation
//import SwiftUI
//
//struct HomeView: View {
//    @State private var showAlert = false
//    @State private var navigate = false
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                
//                // Custom Button
//                Button(action: {
//                    // When button tapped, show alert first
//                    showAlert = true
//                }) {
//                    HStack {
//                        Image(systemName: "arrow.up.circle.fill")
//                        Text("Set pick up location")
//                            .bold()
//                        Spacer()
//                    }
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.orange)
//                    .cornerRadius(12)
//                }
//                .alert("Please enter pick up location first", isPresented: $showAlert) {
//                    Button("OK") {
//                        // After pressing OK, navigate
//                        navigate = true
//                    }
//                }
//                
//                // Hidden NavigationLink triggered programmatically
//                NavigationLink(destination: SetPickupLocationView(), isActive: $navigate) {
//                    EmptyView()
//                }
//                
//                Spacer()
//            }
//            .padding()
//            .navigationTitle("Home")
//        }
//    }
//}
//
////struct SetPickupLocationView: View {
////    var body: some View {
////        VStack {
////            Text("This is the Set Pickup Location Screen")
////                .font(.title)
////                .padding()
////            Spacer()
////        }
////        .navigationTitle("Set pick up location")
////        .navigationBarTitleDisplayMode(.inline)
////    }
////}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


import SwiftUI

struct HomeView: View {
    @State private var pickupLocation: String = ""
    @State private var showAlert = false
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // TextField to enter pick up location
                TextField("Enter pick up location", text: $pickupLocation)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                // Button
                Button(action: {
                    if pickupLocation.isEmpty {
                        // If no pick up location entered
                        showAlert = true
                    } else {
                        // If location entered, navigate
                        navigate = true
                    }
                }) {
                    HStack {
                        Image(systemName: "arrow.up.circle.fill")
                        Text("Set pick up location")
                            .bold()
                        Spacer()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                .alert("Please enter pick up location first", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
                
                // Hidden NavigationLink
//                NavigationLink(destination: SetPickupLocationView(), isActive: $navigate) {
//                    EmptyView()
//                }
//                
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
