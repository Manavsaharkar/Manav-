//
//  PubBarScreen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

//
//import SwiftUI
//
//struct PubBarCategory: Identifiable {
//    let id = UUID()
//    let name: String
//    let imageName: String
//}
//
//struct PubAndBarView: View {
//    
//    let categories: [PubBarCategory] = [
//        PubBarCategory(name: "Beer", imageName: "beer"),
//        PubBarCategory(name: "Wine", imageName: "wineglass"),
//        PubBarCategory(name: "Cocktails", imageName: "cocktail"),
//        PubBarCategory(name: "Whiskey", imageName: "whiskey"),
//        PubBarCategory(name: "Vodka", imageName: "vodka"),
//        PubBarCategory(name: "Snacks", imageName: "snacks")
//    ]
//    
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(categories) { category in
//                        VStack {
//                            Image(category.imageName)
//                                .resizable()
//                                .scaledToFit() // Makes sure the image fits proportionally
//                                .frame(width: 300, height: 300) // Size to fit your design
//                                .cornerRadius(10) // Optional: adds rounded corners to the image
//                                .shadow(radius: 5) // Optional: adds shadow around the image
//                                .padding()
//                            
//                            Text(category.name)
//                                .font(.headline)
//                                .foregroundColor(.primary)
//                        }
//                        .frame(width: 160, height: 160)
//                        .background(Color(.systemGray6)) // Background color of each item
//                        .cornerRadius(15)
//                        .shadow(radius: 5)
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Pub & Bar")
//        }
//    }
//}
//
//struct PubAndBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        PubAndBarView()
//    }
//}

import SwiftUI

struct PubBarCategory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct PubAndBarView: View {
    
    let categories: [PubBarCategory] = [
        PubBarCategory(name: "Beer", imageName: "beer"),
        PubBarCategory(name: "Wine", imageName: "wineglass"),
        PubBarCategory(name: "Cocktails", imageName: "cocktail"),
        PubBarCategory(name: "Whiskey", imageName: "whiskey"),
        PubBarCategory(name: "Vodka", imageName: "vodka"),
        PubBarCategory(name: "Snacks", imageName: "snacks")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(categories) { category in
                        VStack {
                            ZStack {
                                // Image
                                Image(category.imageName)
                                    .resizable()
                                    .scaledToFit() // Makes sure the image fits proportionally
                                    .frame(width: 300, height: 300) // Size of the image
                                    .cornerRadius(10) // Optional: adds rounded corners to the image
                                    .shadow(radius: 5) // Optional: adds shadow around the image
                                
                                // Text on top of the image
                                Text(category.name)
                                    .font(.headline)
                                    .foregroundColor(.white) // White text on top of the image
                                    .padding(10) // Padding around the text
                                    .background(Color.black.opacity(0.5)) // Semi-transparent background for text
                                    .cornerRadius(5) // Rounded corners for the text background
                                    .padding(5) // Padding around the text background
                            }
                            
                        }
                        .frame(width: 160, height: 160) // Frame for the entire card
                        .background(Color(.systemGray6)) // Background color of each item
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .navigationTitle("Pub & Bar")
        }
    }
}

struct PubAndBarView_Previews: PreviewProvider {
    static var previews: some View {
        PubAndBarView()
    }
}
