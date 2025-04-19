//
//  Budget Friendly Screen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct BudgetPlace: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let location: String
    let rating: Double
    let priceRange: String
    let specialOffer: String
}

struct BudgetFriendlyScreen: View {
    let budgetPlaces: [BudgetPlace] = [
        BudgetPlace(name: "Cafe Joy", imageName: "budget1", location: "Mumbai", rating: 4.3, priceRange: "$", specialOffer: "10% Off First Visit"),
        BudgetPlace(name: "Bistro Bites", imageName: "budget2", location: "Delhi", rating: 4.1, priceRange: "$$", specialOffer: "Free Coffee"),
        BudgetPlace(name: "Quick Eats", imageName: "budget3", location: "Chennai", rating: 4.0, priceRange: "$", specialOffer: "20% Off Combo Meals"),
        BudgetPlace(name: "Snack Shack", imageName: "budget4", location: "Bangalore", rating: 4.2, priceRange: "$", specialOffer: "Free Dessert"),
        BudgetPlace(name: "Urban Tummy", imageName: "budget5", location: "Hyderabad", rating: 4.4, priceRange: "$$", specialOffer: "15% Off Today")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Budget Friendly Spots")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ForEach(budgetPlaces) { place in
                    VStack(alignment: .leading, spacing: 8) {
                        Image(place.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 220)
                            .cornerRadius(12)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(place.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text(place.location)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            HStack(spacing: 10) {
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.caption)
                                    Text("\(place.rating, specifier: "%.1f")")
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                Text(place.priceRange)
                                    .font(.caption)
                                    .padding(6)
                                    .background(Color.green.opacity(0.2))
                                    .cornerRadius(6)
                            }
                            
                            Text(place.specialOffer)
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(8)
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(14)
                    .shadow(color: .gray.opacity(0.25), radius: 5, x: 0, y: 4)
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Budget Friendly")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BudgetFriendlyScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BudgetFriendlyScreen()
        }
    }
}
