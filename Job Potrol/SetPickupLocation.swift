//
//  SetPickupLocation.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct SetPickupLocationView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search for building, area, or street", text: $searchText)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Use Current Location Button
                Button(action: {
                    // Action for using current location
                }) {
                    HStack {
                        NavigationLink(destination: MapScreenView()) { // ✅ Wrap this part inside NavigationLink
                            
                            Image(systemName: "location.fill")
                                .foregroundColor(.orange)
                                .padding(8)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                            
                            Text("Use Current Location")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
                
                // Info Text
                Text("Update your location on the Genie home page to select address from a different city")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                Spacer()
            }
            .navigationTitle("Set pick up location")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SetPickupLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SetPickupLocationView()
    }
}
