//
//  LocationSearchView.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//
//
//import Foundation
//import SwiftUI
//
//struct LocationSearchView: View {
//    @State private var searchText: String = ""
//
//    var body: some View {
//        NavigationStack { // IMPORTANT: wrap inside NavigationStack
//            ScrollView{
//                VStack(alignment: .leading, spacing: 20) {
//                    HStack {
//                        Button(action: {
//                            // Handle back button action
//                        }) {
//                            Image(systemName: "arrow.left")
//                                .foregroundColor(.black)
//                        }
//                        
//                        Text("Enter your area or apartment name")
//                            .font(.headline)
//                            .foregroundColor(.black)
//                        
//                        Spacer()
//                    }
//                    .padding(.horizontal)
//                    .padding(.top)
//                    
//                    HStack {
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                        TextField("Try JP Nagar, Siri Gardenia, etc.", text: $searchText)
//                            .foregroundColor(.gray)
//                    }
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
//                    .padding(.horizontal)
//                    
//                    Button(action: {
//                        // Handle "Use my current location" action
//                    }) {
//                        HStack {
//                            
//                            
//                            NavigationLink(destination: MapScreenView()) {
//                                Image(systemName: "location.fill")
//                                    .foregroundColor(.orange)
//                                Text("Use my current location")
//                                    .foregroundColor(Color.orange.opacity(0.8)) // Darker orange
//
////                                    .foregroundColor(Color(red: 0.8, green: 0.4, blue: 0))
//
//                                    .bold()
//                                    .font(.title3)
////                                    .fontWeight(.medium)
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                    
//                    Spacer()
//                }
//                /* .background(Color(UIColor.systemGroupedBackground))*/ // Light background
//                .edgesIgnoringSafeArea(.all)
//            }
//        }
//    }
//}
//
//struct LocationSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationSearchView()
//    }
//}
import SwiftUI

struct LocationSearchView: View {
    @State private var searchText: String = ""
    @State private var locations: [String] = ["JP Nagar", "Siri Gardenia", "MG Road", "BTM Layout"]

    var filteredLocations: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return locations.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Button(action: {
                            // Handle back button action
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }
                        
                        Text("Enter your area or apartment name")
                            .font(.headline)
                            .foregroundColor(.black)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Try JP Nagar, Siri Gardenia, etc.", text: $searchText)
                            .foregroundColor(.gray)
                            .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                    .padding(.horizontal)
                    
                    if !filteredLocations.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(filteredLocations, id: \.self) { location in
                                Text(location)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    
                    NavigationLink(destination: MapScreenView()) {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.orange)
                            Text("Use my current location")
                                .foregroundColor(Color.orange.opacity(0.8))
                                .bold()
                                .font(.title3)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
