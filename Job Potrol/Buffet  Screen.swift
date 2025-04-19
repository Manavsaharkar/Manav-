//
//  Buffet  Screen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct BuffetPlace: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let location: String
    let rating: Double
    let pricePerPerson: String
    let buffetTiming: String
    let offer: String
}

struct BuffetScreen: View {
    let buffetPlaces: [BuffetPlace] = [
        BuffetPlace(name: "Feast Garden", imageName: "buffet1", location: "Mumbai", rating: 4.6, pricePerPerson: "$25", buffetTiming: "12 PM - 4 PM", offer: "10% Off Lunch Buffet"),
        BuffetPlace(name: "Unlimited Bites", imageName: "buffet2", location: "Delhi", rating: 4.5, pricePerPerson: "$20", buffetTiming: "7 PM - 11 PM", offer: "Free Mocktail"),
        BuffetPlace(name: "Royal Buffet", imageName: "buffet3", location: "Bangalore", rating: 4.8, pricePerPerson: "$30", buffetTiming: "12 PM - 3 PM", offer: "Buy 3 Get 1 Free"),
        BuffetPlace(name: "Global Platters", imageName: "buffet4", location: "Chennai", rating: 4.7, pricePerPerson: "$28", buffetTiming: "1 PM - 4 PM", offer: "20% Off Family Packs"),
        BuffetPlace(name: "Food Carnival", imageName: "buffet5", location: "Hyderabad", rating: 4.4, pricePerPerson: "$22", buffetTiming: "6 PM - 10 PM", offer: "Free Dessert Platter")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Buffet Restaurants 🍽️")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ForEach(buffetPlaces) { place in
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
                            
                            HStack {
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.caption)
                                    Text("\(place.rating, specifier: "%.1f")")
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                Text("\(place.pricePerPerson)/person")
                                    .font(.caption)
                                    .foregroundColor(.green)
                            }
                            
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.blue)
                                    .font(.caption)
                                Text(place.buffetTiming)
                                    .font(.caption)
                            }
                            
                            Text(place.offer)
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.orange.opacity(0.8))
                                .cornerRadius(8)
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
        .navigationTitle("Buffet Deals")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BuffetScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BuffetScreen()
        }
    }
}
