//
//  OutDroom screen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct OutdoorPlace: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let location: String
    let rating: Double
    let cuisineType: String
    let specialNote: String
}

struct OutdoorScreen: View {
    let outdoorPlaces: [OutdoorPlace] = [
        OutdoorPlace(name: "The Garden Cafe", imageName: "outdoor1", location: "Pune", rating: 4.7, cuisineType: "Italian, Continental", specialNote: "Pet Friendly 🌸"),
        OutdoorPlace(name: "Sunset Deck", imageName: "outdoor2", location: "Goa", rating: 4.8, cuisineType: "Seafood, Indian", specialNote: "Beach View 🌊"),
        OutdoorPlace(name: "Forest Retreat", imageName: "outdoor3", location: "Manali", rating: 4.6, cuisineType: "Local, Organic", specialNote: "Live Music 🎶"),
        OutdoorPlace(name: "Skyline Dine", imageName: "outdoor4", location: "Mumbai", rating: 4.5, cuisineType: "Multi-Cuisine", specialNote: "Rooftop Dining 🌃"),
        OutdoorPlace(name: "River Breeze", imageName: "outdoor5", location: "Kerala", rating: 4.9, cuisineType: "South Indian, Seafood", specialNote: "Riverside Tables 🏞️")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Outdoor Dining 🌳")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ForEach(outdoorPlaces) { place in
                    VStack(alignment: .leading, spacing: 10) {
                        Image(place.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 230)
                            .cornerRadius(16)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(place.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(place.location)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(place.cuisineType)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            HStack {
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.caption)
                                    Text("\(place.rating, specifier: "%.1f")")
                                        .font(.caption)
                                }
                                Spacer()
                                Text(place.specialNote)
                                    .font(.caption2)
                                    .padding(6)
                                    .background(Color.green.opacity(0.7))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 5)
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Outdoor Dining")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OutdoorScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OutdoorScreen()
        }
    }
}
