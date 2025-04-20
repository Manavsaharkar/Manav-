//
//  MapLoction Screen.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//

import Foundation
import SwiftUI
import MapKit

struct mapLoction: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    // Top Bar
                    HStack {
                        NavigationLink(destination: MapScreenView()) { // ✅ Wrap this part inside NavigationLink
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
                    .padding(.top)

                    // Rest of your code...

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search for 'Burger'", text: $searchText)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Image(systemName: "mic.fill")
                            .foregroundColor(.orange)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 10)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 45) {
                        ServiceCardView(title: "FOOD DELIVERY", subtitle: "MAAAAD DEALS", badge: "LIVE NOW", imageName: "sandwich")
                        ServiceCardView(title: "INSTAMART", subtitle: "GET ANYTHING INSTANTLY", badge: "UP TO ₹100 OFF", time: "11 mins", imageName: "vegetables")
                        ServiceCardView(title: "DINEOUT", subtitle: "DRINK & DINE FEST", badge: "MIN 30% OFF", imageName: "drinks")
                        ServiceCardView(title: "GENIE", subtitle: "SEND PARCELS", imageName: "biker")
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

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
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

// MARK: - New MapScreenView
struct MapScreenView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.3919, longitude: 72.8397), // Vasai Coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Location")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct mapLoction_Previews: PreviewProvider {
    static var previews: some View {
        mapLoction()
    }
}
