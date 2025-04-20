//
//  Lexury Dinning Screen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct DiningRoom: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let location: String
    let rating: Double
    let pricePerPerson: String
    let specialOffer: String
}

struct LuxuryDiningRoomScreen: View {
    let diningRooms: [DiningRoom] = [
        DiningRoom(name: "The Royal Feast", imageName: "dining1", location: "New York", rating: 4.9, pricePerPerson: "$120", specialOffer: "20% Off Today"),
        DiningRoom(name: "Golden Plate", imageName: "dining2", location: "Paris", rating: 4.8, pricePerPerson: "$150", specialOffer: "Free Champagne"),
        DiningRoom(name: "Emerald Dining", imageName: "dining3", location: "Dubai", rating: 5.0, pricePerPerson: "$200", specialOffer: "VIP Lounge Access"),
        DiningRoom(name: "Opulent Bites", imageName: "dining4", location: "London", rating: 4.7, pricePerPerson: "$130", specialOffer: "Complimentary Dessert"),
        DiningRoom(name: "Majestic Dine", imageName: "dining5", location: "Rome", rating: 4.6, pricePerPerson: "$110", specialOffer: "15% Off")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Luxury Dining Rooms")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ForEach(diningRooms) { room in
                    VStack(alignment: .leading, spacing: 10) {
                        Image(room.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .cornerRadius(16)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(room.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(room.location)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            HStack(spacing: 10) {
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.caption)
                                    Text("\(room.rating, specifier: "%.1f")")
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                Text("Avg. \(room.pricePerPerson)/person")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Text(room.specialOffer)
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.pink.opacity(0.8))
                                .cornerRadius(8)
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .gray.opacity(0.4), radius: 8, x: 0, y: 6)
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Luxury Dining")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LuxuryDiningRoomScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LuxuryDiningRoomScreen()
        }
    }
}
