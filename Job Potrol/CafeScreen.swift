//
//  CafeScreen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import SwiftUI

struct Cafe: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let rating: Double
    let price: String
    let percentageOff: Int
}

struct CafeScreen: View {
    let cafes: [Cafe] = [
        Cafe(name: "Coffee House", imageName: "cafe1", rating: 4.5, price: "$5.00", percentageOff: 10),
        Cafe(name: "Sunset Brew", imageName: "cafe2", rating: 4.0, price: "$4.50", percentageOff: 15),
        Cafe(name: "Morning Bliss", imageName: "cafe3", rating: 4.8, price: "$6.00", percentageOff: 20),
        Cafe(name: "Choco Mocha", imageName: "cafe4", rating: 4.2, price: "$5.50", percentageOff: 5),
        Cafe(name: "Urban Grind", imageName: "cafe5", rating: 4.6, price: "$4.80", percentageOff: 12)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Cafes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                ForEach(cafes) { cafe in
                    VStack(alignment: .leading) {
                        Image(cafe.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .cornerRadius(12)
                            .clipped()
                        
                        Text(cafe.name)
                            .font(.headline)
                            .padding([.leading, .top], 8)
                        
                        HStack {
                            Text("Rating: \(cafe.rating, specifier: "%.1f") ⭐️")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text(cafe.price)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("\(cafe.percentageOff)% Off")
                                .font(.subheadline)
                                .foregroundColor(.red)
                        }
                        .padding([.leading, .bottom], 8)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Cafes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CafeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CafeScreen()
        }
    }
}
