//
//  DineOut Screen .swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//

//
//import SwiftUI
//
//struct SecondScreenView: View {
//    let categoriesTop = [
//        ("Restaurants near me", "location_icon"),
//        ("Pre-Book Offers", "prebook_icon")
//    ]
//
//    let categoriesGrid = [
//        ("Pubs & Bars", "cocktail_icon"),
//        ("Family Friendly", "family_icon"),
//        ("Pure Veg", "pureveg_icon"),
//        ("Rooftop & outdoors", "rooftop_icon"),
//        ("Budget friendly", "budget_icon"),
//        ("Buffets", "buffet_icon"),
//        ("Luxury dining", "luxury_icon"),
//        ("Cafe's", "cafe_icon")
//    ]
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 20) {
//
//                // Search bar
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                    Text("Search for restaurants")
//                        .foregroundColor(.gray)
//                    Spacer()
//                }
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(12)
//                .padding(.horizontal)
//
//                // Header
//                Text("Hey, what's on your mind?")
//                    .font(.title3)
//                    .bold()
//                    .padding(.horizontal)
//
//                // Top 2 categories
//                HStack(spacing: 12) {
//                    ForEach(categoriesTop, id: \.0) { item in
//                        VStack {
//                            HStack {
//                                Image(item.1)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 50)
//                                Spacer()
//                            }
//                            Spacer()
//                            HStack {
//                                Text(item.0)
//                                    .font(.subheadline)
//                                    .bold()
//                                Spacer()
//                            }
//                        }
//                        .padding()
//                        .frame(width: 160, height: 90)
//                        .background(Color(.systemGray6))
//                        .cornerRadius(16)
//                    }
//                }
//                .padding(.horizontal)
//
//           
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                    ForEach(categoriesGrid, id: \.0) { item in
//                        ZStack {
//                            Image(item.1)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 100, height: 100)
//                                .clipped()
//                                .cornerRadius(16)
//
//                            Text(item.0)
//                                .font(.caption)
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(item.0 == "Pure Veg" ? .green : .white)
//                                .padding(6)
//                                .background(Color.black.opacity(0.5))
//                                .cornerRadius(8)
//                        }
//                        .frame(width: 100, height: 100)
//                        .background(Color.white)
//                        .cornerRadius(16)
//                        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
//                    }
//                }
//
//                .padding(.horizontal)
//
//                // Promo Banner
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("SWIGGY SIXES")
//                        .font(.caption)
//                        .bold()
//                        .foregroundColor(.orange)
//                    Text("CRAAAAYZZZY DEAL")
//                        .font(.title2)
//                        .bold()
//
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text("The Tipsy Tiger\nGarden Bar")
//                                .font(.headline)
//                                .foregroundColor(.blue)
//                            Text("Marol")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                            Text("FLAT 30% OFF")
//                                .font(.title3)
//                                .bold()
//                                .padding(.top, 4)
//                        }
//
//                        Spacer()
//
//                        Image("tipsy_banner") // Add your image asset
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 120, height: 100)
//                            .cornerRadius(12)
//                    }
//
//                    Button(action: {}) {
//                        Text("GRAB IT NOW")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(12)
//                    }
//                }
//                .padding()
//                .background(
//                    LinearGradient(
//                        gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.8)]),
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    )
//                )
//                .cornerRadius(16)
//                .padding(.horizontal)
//                .padding(.bottom, 30)
//                
////                
////                
////                Text("Fast delivery")
////                    .font(.headline)
////                    .padding(.horizontal)
////                
////                ScrollView(.horizontal, showsIndicators: false) {
////                    HStack(spacing: 16) {
////                        RestaurantCard(name: "Domino's Pizza", category: "Pizzas", rating: "4.3", time: "20–25 mins", image: "Domino's Pizza")
////                        RestaurantCard(name: "Jumboking", category: "Burgers", rating: "3.7", time: "25–30 mins", image: "Jomboking")
////                        RestaurantCard(name: "Sarvottam Cafe", category: "South Indian", rating: "4.1", time: "25–30 mins", image: "Dosa")
////                    }
////                }
//                Text("What's on your mind?")
//                    .font(.headline)
//                    .padding(.horizontal)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 20) {
//                        FoodSuggestionItem(name: "Dosa", image: "Dosa")
//                        FoodSuggestionItem(name: "Sandwich1", image: "Sandwich1")
//                        FoodSuggestionItem(name: "Idli", image: "idli")
//                        FoodSuggestionItem(name: "Biryani", image: "Biryani")
//                        FoodSuggestionItem(name: "Paratha", image: "Paratha")
//                    }
//                    
//                    
//                }
//                
//                
//                
//                VStack(spacing: 24) {
//                    RestaurantCardFull(
//                        imageName: "Biryani",
//                        name: "Charcoal Eats – Biryani & Beyond",
//                        rating: "3.8 (60)",
//                        location: "Vasai, 5.9 km",
//                        cuisine: "Biryani, Kebabs",
//                        price: "₹500 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Items at ₹199"
//                    )
//                    
//                    RestaurantCardFull(
//                        imageName: "noodles",
//                        name: "Chinese Wok",
//                        rating: "3.9 (663)",
//                        location: "Vasai, 2.8 km",
//                        cuisine: "Chinese",
//                        price: "₹250 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Best In Chinese"
//                    )
//                    
//                    
//                    RestaurantCardFull(
//                        imageName: "Sandwich1",
//                        name: "Charcoal Eats – Biryani & Beyond",
//                        rating: "3.8 (60)",
//                        location: "Vasai, 5.9 km",
//                        cuisine: "Biryani, Kebabs",
//                        price: "₹500 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Items at ₹199"
//                    )
//                    
//                    
//                    RestaurantCardFull(
//                        imageName: "Dosa",
//                        name: "Charcoal Eats – Biryani & Beyond",
//                        rating: "3.8 (60)",
//                        location: "Vasai, 5.9 km",
//                        cuisine: "Biryani, Kebabs",
//                        price: "₹500 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Items at ₹199"
//                    )
//                    RestaurantCardFull(
//                        imageName: "Paratha",
//                        name: "Charcoal Eats – Biryani & Beyond",
//                        rating: "3.8 (60)",
//                        location: "Vasai, 5.9 km",
//                        cuisine: "Biryani, Kebabs",
//                        price: "₹500 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Items at ₹199"
//                    )
//                    
//                    
//                    RestaurantCardFull(
//                        imageName: "Sandwich1",
//                        name: "Charcoal Eats – Biryani & Beyond",
//                        rating: "3.8 (60)",
//                        location: "Vasai, 5.9 km",
//                        cuisine: "Biryani, Kebabs",
//                        price: "₹500 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Items at ₹199"
//                    )
//                    
//                    RestaurantCardFull(
//                        imageName: "Biryani",
//                        name: "Charcoal Eats – Biryani & Beyond",
//                        rating: "3.8 (60)",
//                        location: "Vasai, 5.9 km",
//                        cuisine: "Biryani, Kebabs",
//                        price: "₹500 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Items at ₹199"
//                    )
//                    RestaurantCardFull(
//                        imageName: "biker",
//                        name: "Charcoal Eats – Biryani & Beyond",
//                        rating: "3.8 (60)",
//                        location: "Vasai, 5.9 km",
//                        cuisine: "Biryani, Kebabs",
//                        price: "₹500 for two",
//                        deliveryTime: "35–40 MINS",
//                        tag: "Items at ₹199"
//                    )
//                    
//                    
//                }
//                .padding(.horizontal)
//
//            }
//            
//            .padding(.top)
//        }
//        .background(Color(.systemGroupedBackground))
//    }
//}
//
//struct SecondScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondScreenView()
//    }
//}

import SwiftUI

struct SecondScreenView: View {
    let categoriesTop = [
        ("Restaurants near me", "location_icon"),
        ("Pre-Book Offers", "prebook_icon")
    ]

    let categoriesGrid = [
        ("Pubs & Bars", "cocktail_icon"),
        ("Family Friendly", "family_icon"),
        ("Pure Veg", "pureveg_icon"),
        ("Rooftop & outdoors", "rooftop_icon"),
        ("Budget friendly", "budget_icon"),
        ("Buffets", "buffet_icon"),
        ("Luxury dining", "luxury_icon"),
        ("Cafe's", "cafe_icon")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Search bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Search for restaurants")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)

                    // Header
                    Text("Hey, what's on your mind?")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)

                    // Top 2 categories
                    HStack(spacing: 12) {
                        ForEach(categoriesTop, id: \.0) { item in
                            VStack {
                                HStack {
                                    Image(item.1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 50)
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Text(item.0)
                                        .font(.subheadline)
                                        .bold()
                                    Spacer()
                                }
                            }
                            .padding()
                            .frame(width: 160, height: 90)
                            .background(Color(.systemGray6))
                            .cornerRadius(16)
                        }
                    }
                    .padding(.horizontal)

                    // Grid of categories
                    // Grid of categories
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(categoriesGrid, id: \.0) { item in
                            if item.0 == "Pubs & Bars" {
                                NavigationLink(destination: PubAndBarView()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else if item.0 == "Family Friendly" {
                                NavigationLink(destination: FamilyFriendScreen()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else if item.0 == "Pure Veg" {
                                NavigationLink(destination: PureVegScreen()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else if item.0 == "Rooftop & outdoors" {
                                NavigationLink(destination: OutdoorScreen()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else if item.0 == "Budget friendly" {
                                NavigationLink(destination: BudgetFriendlyScreen()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else if item.0 == "Buffets" {
                                NavigationLink(destination: BuffetScreen()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else if item.0 == "Luxury dining" {
                                NavigationLink(destination: LuxuryDiningRoomScreen()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else if item.0 == "Cafe's" {
                                NavigationLink(destination: CafeScreen()) {
                                    GridItemView(title: item.0, imageName: item.1)
                                }
                            } else {
                                GridItemView(title: item.0, imageName: item.1)
                            }
                        }
                    }
                    .padding(.horizontal)


                    // Promo Banner
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SWIGGY SIXES")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.orange)
                        Text("CRAAAAYZZZY DEAL")
                            .font(.title2)
                            .bold()

                        HStack {
                            VStack(alignment: .leading) {
                                Text("The Tipsy Tiger\nGarden Bar")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                Text("Marol")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("FLAT 30% OFF")
                                    .font(.title3)
                                    .bold()
                                    .padding(.top, 4)
                            }
                            Spacer()
                            Image("tipsy_banner")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 100)
                                .cornerRadius(12)
                        }

                        Button(action: {}) {
                            Text("GRAB IT NOW")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.8)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.bottom, 30)

                    // Food Suggestions
                    Text("What's on your mind?")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            FoodSuggestionItem(name: "Dosa", image: "Dosa")
                            FoodSuggestionItem(name: "Sandwich1", image: "Sandwich1")
                            FoodSuggestionItem(name: "Idli", image: "idli")
                            FoodSuggestionItem(name: "Biryani", image: "Biryani")
                            FoodSuggestionItem(name: "Paratha", image: "Paratha")
                        }
                    }

                    // Restaurants
                    VStack(spacing: 24) {
                        RestaurantCardFull(
                            imageName: "Biryani",
                            name: "Charcoal Eats – Biryani & Beyond",
                            rating: "3.8 (60)",
                            location: "Vasai, 5.9 km",
                            cuisine: "Biryani, Kebabs",
                            price: "₹500 for two",
                            deliveryTime: "35–40 MINS",
                            tag: "Items at ₹199"
                        )
                        RestaurantCardFull(
                            imageName: "noodles",
                            name: "Chinese Wok",
                            rating: "3.9 (663)",
                            location: "Vasai, 2.8 km",
                            cuisine: "Chinese",
                            price: "₹250 for two",
                            deliveryTime: "35–40 MINS",
                            tag: "Best In Chinese"
                        )
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Discover")
            .background(Color(.systemGroupedBackground))
        }
    }
}

// Reusable Grid Item View
struct GridItemView: View {
    let title: String
    let imageName: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(16)

            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(title == "Pure Veg" ? .green : .white)
                .padding(6)
                .background(Color.black.opacity(0.5))
                .cornerRadius(8)
        }
        .frame(width: 100, height: 100)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
    }
}

struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView()
    }
}
