//
//  ContentView.swift
//  Job Potrol
//
//  Created by Manav on 16/04/25.

import SwiftUI
import Speech
struct SplashScreenView: View {
    @State private var animateLogo = false
    @State private var moveUp = false
    @State private var showMainView = false

    var body: some View {
        ZStack {
            if showMainView {
                MainTabView() // 👈 After splash, move to MainTabView
            } else {
                Color.white
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    
                    Image("yourLogo") // 👉 Put your logo in Assets with this name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .scaleEffect(animateLogo ? 1.0 : 0.5)
                        .offset(y: moveUp ? -100 : 0)
                        .opacity(animateLogo ? 1 : 0)
                        .animation(.interpolatingSpring(stiffness: 70, damping: 8), value: animateLogo)
                        .animation(.easeOut(duration: 1.0), value: moveUp)

                    Spacer()
                }
                .onAppear {
                    animateLogo = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        moveUp = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            showMainView = true
                        }
                    }
                }
            }
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab = "Swiggy"
    
    @StateObject private var speechRecognizer = SpeechRecognizer()
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Main Content based on Tab
                if selectedTab == "Swiggy" {
                    SwiggyHomeView()
                } else if selectedTab == "Food" {
                    FoodDeliveryHomeView()
                } else if selectedTab == "InstamartView" {
                    InstamartView()
                } else if selectedTab == "Dineout" {
                    SecondScreenView() // Show the new Dineout screen
                } else if selectedTab == "Genie" {
                    GenieView() // ✅ Show Genie screen here
                } else {
                    Text("\(selectedTab) View Coming Soon...")
                        .font(.largeTitle)
                        .padding()
                }
                // Bottom Tab Bar
                HStack {
                    BottomTabItem(icon: "flame.fill", title: "Swiggy", isActive: selectedTab == "Swiggy")
                        .onTapGesture {
                            if selectedTab != "Swiggy" { selectedTab = "Swiggy" }
                        }
                    BottomTabItem(icon: "fork.knife", title: "Food", isActive: selectedTab == "Food")
                        .onTapGesture {
                            if selectedTab != "Food" { selectedTab = "Food" }
                        }
                    BottomTabItem(icon: "cart", title: "Instamart", isActive: selectedTab == "InstamartView")
                        .onTapGesture {
                            if selectedTab != "InstamartView" { selectedTab = "InstamartView" }
                        }
                    BottomTabItem(icon: "building.2.fill", title: "Dineout", isActive: selectedTab == "Dineout")
                        .onTapGesture {
                            if selectedTab != "Dineout" { selectedTab = "Dineout" }
                        }
                    BottomTabItem(icon: "shippingbox.fill", title: "Genie", isActive: selectedTab == "Genie")
                        .onTapGesture {
                            if selectedTab != "Genie" { selectedTab = "Genie" }
                        }
                }
                .padding()
                .background(Color.white.shadow(radius: 4))
            }

        }
    }
}
// MARK: - SwiggyHomeView

struct SwiggyHomeView: View {
    @State private var searchText = ""
    
    @StateObject private var speechRecognizer = SpeechRecognizer()
    

    var body: some View {
        NavigationStack {
            ScrollView {  // ✅ Added ScrollView
                VStack(spacing: 10) {
                    // Top Bar
                    HStack {
                        NavigationLink(destination: LocationSearchView()) {
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
                    .padding(.horizontal)
                    .padding(.top) // Extra padding for top space

                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        //                        Text("Search for 'Sweets'")
                        TextField("Search for 'Sweets'", text: $searchText)
                            .foregroundColor(.gray)
                        Spacer()
                        
                        
                        Button(action: {
                                       speechRecognizer.startRecording()
                                   }) {
                                       Image(systemName: "mic.fill")
                                           .foregroundColor(.orange)
                                   }
                               }

                        
                    
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 10)

                    // Services Grid
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 45) {
                        ServiceCardView(title: "FOOD DELIVERY", subtitle: "MAAAAD DEALS", badge: "LIVE NOW", imageName: "sandwich")
                        ServiceCardView(title: "INSTAMART", subtitle: "GET ANYTHING INSTANTLY", badge: "UP TO ₹100 OFF", time: "11 mins", imageName: "vegetables")
                        ServiceCardView(title: "DINEOUT", subtitle: "DRINK & DINE FEST", badge: "MIN 30% OFF", imageName: "drinks")
                        ServiceCardView(title: "GENIE", subtitle: "SEND PARCELS", imageName: "biker")
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

                    // Live it up footer
                    VStack(spacing: 8) {
                        (
                            Text("Live")
                                .font(.largeTitle)
                                .bold() +
                            Text(" it up!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.gray)
                        )
                        
                        Text("Crafted with ❤️ in Bengaluru, India")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 100)
                }
            }
            .navigationTitle("") // Optional: remove navigation bar title
            .navigationBarHidden(true) // Optional: hide navigation bar
        }
    }
}



// MARK: - BottomTabItem

struct BottomTabItem: View {
    var icon: String
    var title: String
    var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundColor(isActive ? .orange : .gray)
            Text(title)
                .font(.caption)
                .foregroundColor(isActive ? .orange : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - ServiceCardView

struct ServiceCardView: View {
    var title: String
    var subtitle: String
    var badge: String? = nil
    var time: String? = nil
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).font(.headline).bold()
            Text(subtitle).font(.subheadline).foregroundColor(.gray)
            
            if let badge = badge {
                Text(badge)
                    .font(.caption)
                    .foregroundColor(.orange)
                    .padding(4)
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(5)
            }
            
            if let time = time {
                Text("⚡ \(time)")
                    .font(.caption2)
                    .foregroundColor(.orange)
            }
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .cornerRadius(12)
                .scaledToFit()
                .frame(height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.black, lineWidth: 2)
                )
        }
        .padding()
        .frame(height: 160)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


