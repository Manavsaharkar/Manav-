//
//  GenieView.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//

//import Foundation
//import SwiftUI
//
//struct GenieView: View {
//    var body: some View {
//        NavigationStack { // IMPORTANT: wrap inside NavigationStack
//            
//            VStack(spacing: 0) {
//                
//                // Top Location Bar
//                HStack {
//                    Image(systemName: "location.fill")
//                        .foregroundColor(.black)
//                    VStack(alignment: .leading, spacing: 2) {
//                        Text("Vasai East")
//                            .font(.headline)
//                        Text("Samarth Krupa Nagar, Vasai East, Vasai-Virar...")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                    }
//                    Spacer()
//                    
//                    NavigationLink(destination: LoginScreenView()) {
//                        Image(systemName: "person.circle.fill")
//                            .resizable()
//                            .frame(width: 32, height: 32)
//                    }
//                    
//                }
//                .padding()
//                .background(Color(.systemGray6))
//                
//                ScrollView {
//                    VStack(spacing: 16) {
//                        
//                        // Genie Banner
//                        HStack {
//                            VStack(alignment: .leading, spacing: 4) {
//                                Text("Send or pick up")
//                                    .font(.title2)
//                                    .bold()
//                                Text("anything ")
//                                    .font(.title2) +
//                                Text("instantly!")
//                                    .font(.title2)
//                                    .foregroundColor(.orange)
//                            }
//                            Spacer()
//                            Image(systemName: "scooter")
//                                .resizable()
//                                .frame(width: 70, height: 70)
//                        }
//                        .padding()
//                        .background(LinearGradient(colors: [Color.purple.opacity(0.1), Color.white], startPoint: .top, endPoint: .bottom))
//                        .cornerRadius(12)
//                        .padding(.horizontal)
//                        
//                        // Price Drop Alert
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text("Genie price drop alert!")
//                                    .font(.headline)
//                                    .foregroundColor(.white)
//                                Text("Send parcels at lower rates")
//                                    .font(.subheadline)
//                                    .foregroundColor(.white)
//                            }
//                            Spacer()
//                            Image(systemName: "mic.fill")
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .foregroundColor(.orange)
//                        }
//                        .padding()
//                        .background(LinearGradient(colors: [Color.blue, Color.orange], startPoint: .leading, endPoint: .trailing))
//                        .cornerRadius(12)
//                        .padding(.horizontal)
//                        
//                        // Set Pickup & Drop Location
//                        VStack(spacing: 12) {
//                            Button(action: {}) {
//                                HStack {
//                                    Image(systemName: "arrow.up.circle.fill")
//                                    Text("Set pick up location")
//                                        .bold()
//                                    Spacer()
//                                }
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(Color.orange)
//                                .cornerRadius(12)
//                            }
//                            
//                            Button(action: {}) {
//                                HStack {
//                                    Image(systemName: "arrow.down.circle")
//                                    Text("Set drop location")
//                                        .foregroundColor(.gray)
//                                    Spacer()
//                                }
//                                .padding()
//                                .background(Color(.systemGray6))
//                                .cornerRadius(12)
//                            }
//                        }
//                        .padding(.horizontal)
//                        
//                        // Cashback Banner
//                        HStack {
//                            Image(systemName: "creditcard.fill")
//                                .foregroundColor(.purple)
//                            VStack(alignment: .leading) {
//                                Text("Extra 10% cashback")
//                                    .bold()
//                                Text("WITH SWIGGY HDFC CARD | ABOVE ₹100")
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                            }
//                            Spacer()
//                        }
//                        .padding()
//                        .background(Color(.systemGray6))
//                        .cornerRadius(12)
//                        .padding(.horizontal)
//                        
//                        // Things to Keep in Mind
//                        VStack(alignment: .leading, spacing: 18) {
//                            Text("Things to keep in mind")
//                                .bold()
//                            Label("Items should fit on a two-wheeler", systemImage: "bicycle")
//                            Label("Avoid sending expensive or fragile items", systemImage: "exclamationmark.triangle.fill")
//                            Label("Ensure parcels are properly packed", systemImage: "cube.box.fill")
//                        }
//                        .padding(.horizontal, 16)
//                        .font(.subheadline)
//                        .padding()
//                        .background(Color(.systemGray6))
//                        .cornerRadius(12)
//                        
//                    }
//                    .padding(.top)
//                }
//                
//                // Bottom Navigation Bar
//                HStack {
//                    BottomTabIcon(name: "Swiggy", icon: "house")
//                    BottomTabIcon(name: "Food", icon: "fork.knife")
//                    BottomTabIcon(name: "Instamart", icon: "cart")
//                    BottomTabIcon(name: "Dineout", icon: "building.columns")
//                    BottomTabIcon(name: "Genie", icon: "bolt.fill", isSelected: true)
//                }
//                .padding()
//                .background(Color.white.shadow(radius: 2))
//            }
//        }
//    }
//    
//    struct BottomTabIcon: View {
//        var name: String
//        var icon: String
//        var isSelected: Bool = false
//        
//        var body: some View {
//            VStack {
//                Image(systemName: icon)
//                    .foregroundColor(isSelected ? .orange : .gray)
//                Text(name)
//                    .font(.caption)
//                    .foregroundColor(isSelected ? .orange : .gray)
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//}
//struct GenieView_Previews: PreviewProvider {
//    static var previews: some View {
//        GenieView()
//    }
//}
//
//
//
//    
import SwiftUI

struct GenieView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                // Top Bar
                HStack {
                    NavigationLink(destination: LocationSearchView()) { // ✅ Wrap this part inside NavigationLink
                        VStack(alignment: .leading, spacing: 2) {
                            HStack(spacing: 4) {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.orange)
                                Text("Vasai East")
                                    .font(.headline)
                                    .bold()
                                Image(systemName: "chevron.down")
                                    .font(.caption)
                            }
                            Text("Samarth Krupa Nagar, Vasai East...")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                    }

                    Spacer()
                    NavigationLink(destination: LoginScreenView()) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        // Genie Banner
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Send or pick up")
                                    .font(.title2)
                                    .bold()
                                + Text(" anything ")
                                    .font(.title2)
                                + Text("instantly!")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                            }
                            Spacer()
                            Image(systemName: "scooter")
                                .resizable()
                                .frame(width: 70, height: 70)
                        }
                        .padding()
                        .background(LinearGradient(colors: [Color.purple.opacity(0.1), Color.white], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Price Drop Alert
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Genie price drop alert!")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text("Send parcels at lower rates")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Image(systemName: "mic.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.orange)
                        }
                        .padding()
                        .background(LinearGradient(colors: [Color.blue, Color.orange], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Set Pickup & Drop Location
                        VStack(spacing: 12) {
                            Button(action: {}) {
                                
                                HStack {
                                    NavigationLink(destination: SetPickupLocationView()) {
                                        Image(systemName: "arrow.up.circle.fill")
                                        Text("Set pick up location")
                                            .bold()
                                        Spacer()
                                    }
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.orange)
                                .cornerRadius(12)
                            }
                            
                            Button(action: {}) {
                                HStack {
                                    NavigationLink(destination: HomeView()) {
                                        
                                        Image(systemName: "arrow.down.circle")
                                        Text("Set drop location")
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Cashback Banner
                        HStack {
                            NavigationLink(destination: CashbackOfferView()) {
                                
                                Image(systemName: "creditcard.fill")
                                    .foregroundColor(.purple)
                                VStack(alignment: .leading) {
                                    Text("Extra 10% cashback")
                                        .bold()
                                    Text("WITH SWIGGY HDFC CARD | ABOVE ₹100")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Things to Keep in Mind
                        VStack(alignment: .leading, spacing: 18) {
                            Text("Things to keep in mind")
                                .bold()
                            Label("Items should fit on a two-wheeler", systemImage: "bicycle")
                            Label("Avoid sending expensive or fragile items", systemImage: "exclamationmark.triangle.fill")
                            Label("Ensure parcels are properly packed", systemImage: "cube.box.fill")
                        }
                        .padding(.horizontal, 16)
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                    .padding(.top)
                }
            }
        }
    }
}
