//
//  PureVegScreen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct VegDish: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let rating: Double
    let price: String
    let percentageOff: Int
}

struct PureVegScreen: View {
    let vegDishes: [VegDish] = [
        VegDish(name: "Paneer Tikka", imageName: "paneer_tikka", description: "Spicy grilled paneer cubes.", rating: 4.7, price: "$8.99", percentageOff: 15),
        VegDish(name: "Veg Biryani", imageName: "veg_biryani", description: "Aromatic rice with fresh veggies.", rating: 4.5, price: "$10.50", percentageOff: 20),
        VegDish(name: "Chole Bhature", imageName: "chole_bhature", description: "Delicious chickpeas with fluffy bread.", rating: 4.8, price: "$7.00", percentageOff: 10),
        VegDish(name: "Masala Dosa", imageName: "masala_dosa", description: "Crispy dosa with spicy potato filling.", rating: 4.6, price: "$6.50", percentageOff: 18),
        VegDish(name: "Mix Veg Curry", imageName: "mix_veg_curry", description: "Colorful curry with seasonal veggies.", rating: 4.4, price: "$9.20", percentageOff: 12)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Pure Veg Delights")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                ForEach(vegDishes) { dish in
                    VStack(alignment: .leading, spacing: 8) {
                        Image(dish.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 220)
                            .cornerRadius(16)
                            .clipped()
                        
                        Text(dish.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Text(dish.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                        
                        HStack {
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption)
                                Text("\(dish.rating, specifier: "%.1f")")
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text(dish.price)
                                .font(.caption)
                                .bold()
                            
                            Spacer()
                            
                            Text("\(dish.percentageOff)% OFF")
                                .font(.caption)
                                .foregroundColor(.green)
                                .bold()
                        }
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Pure Veg")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PureVegScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PureVegScreen()
        }
    }
}
