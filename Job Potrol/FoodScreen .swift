//
//  FoodScreen .swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//
import SwiftUI
import Speech

struct FoodDeliveryHomeView: View {
    @State private var searchText = ""
    @State private var isSelected = false
    @State private var selectedFilter: String = "" // 👈 track selected text
    @StateObject private var speechRecognizer = SpeechRecognizer()



    var body: some View {
        NavigationStack { // IMPORTANT: wrap inside NavigationStack
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    // 🔵 FULL BLUE SECTION STARTS HERE
                    VStack(spacing: 10) {
                        // Top Bar
                        HStack {
                            NavigationLink(destination: LocationSearchView()) { // ✅ Wrap this part inside NavigationLink
                                VStack(alignment: .leading, spacing: 2) {
                                    HStack(spacing: 4) {
                                        Image(systemName: "location.fill")
                                            .foregroundColor(.orange)
                                        Text("Vasai East")
                                            .font(.headline)
                                            .bold()
                                        Image(systemName: "chevron.down")
                                            .font(.caption)
                                    }
                                    Text("Samarth Krupa Nagar, Vasai East...")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                            }

                            Spacer()
                            
                            
                            NavigationLink(destination: LoginScreenView()) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                         
                        }
                        .padding(.horizontal)
                        
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            //                        Text("Search for 'Sweets'")
                            TextField("Search for 'Sweets'", text: $searchText)
                                .foregroundColor(.gray)
                            Spacer()
                            
                            
                            Button(action: {
                                           speechRecognizer.startRecording()
                                       }) {
                                           Image(systemName: "mic.fill")
                                               .foregroundColor(.orange)
                                       }
                                   }
                        
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        // MAAAD DEALS Banner
                        VStack(alignment: .leading, spacing: 10) {
                            Text("MAAAAD DEALS")
                                .font(.callout).bold()
                                .foregroundColor(.white)
                            Text("Starting at ₹49")
                                .foregroundColor(.yellow)
                            
                            Button(action: {}) {
                                Text("ORDER NOW")
                                    .bold()
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 10)
                                    .background(Color.yellow)
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Category Icons (Biryani, Rolls, etc.)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 24) {
                                CategoryTile(name: "BIRYANIS", price: "from ₹89", image: "Biryani")
                                CategoryTile(name: "ROLLS", price: "from ₹49", image: "Dosa")
                                CategoryTile(name: "NORTH INDIAN", price: "from ₹79", image: "idli")
                                CategoryTile(name: "BURGERS", price: "from ₹79",image: "family_icon")
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        }
                        
                    }
                    //                .cornerRadius(10)
                    .padding(.top, 20)
                    .background(Color(red: 6/255, green: 22/255, blue: 77/255)) // Full blue section
                    .cornerRadius(40)
                    // 🔵 FULL BLUE SECTION ENDS HERE
                    
                    // Fast Delivery Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Fast delivery")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                RestaurantCard(name: "Domino's Pizza", category: "Pizzas", rating: "4.3", time: "20–25 mins", image: "Domino's Pizza")
                                RestaurantCard(name: "Jumboking", category: "Burgers", rating: "3.7", time: "25–30 mins", image: "Jomboking")
                                RestaurantCard(name: "Sarvottam Cafe", category: "South Indian", rating: "4.1", time: "25–30 mins", image: "Dosa")
                            }
                            .padding(.horizontal)
                        }
                        
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
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        
                        //                    ScrollView(.horizontal, showsIndicators: false) {
                        //                        HStack(spacing: 12) {
                        //                            FilterButton(text: "Filter", icon: "line.3.horizontal.decrease.circle")
                        //                            FilterButton(text: "Sort by", icon: "arrow.up.arrow.down")
                        //                            FilterButton(text: "Offers", isSelected: true)
                        //                            FilterButton(text: "Ratings 4.0+")
                        //                        }
                        //                        .padding(.horizontal)
                        //                    }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                FilterButton(
                                    text: "Filter",
                                    icon: "line.3.horizontal.decrease.circle",
                                    isSelected: selectedFilter == "Filter"
                                ) {
                                    selectedFilter = "Filter"
                                }
                                
                                FilterButton(
                                    text: "Sort by",
                                    icon: "arrow.up.arrow.down",
                                    isSelected: selectedFilter == "Sort by"
                                ) {
                                    selectedFilter = "Sort by"
                                }
                                
                                FilterButton(
                                    text: "Offers",
                                    isSelected: selectedFilter == "Offers"
                                ) {
                                    selectedFilter = "Offers"
                                }
                                
                                FilterButton(
                                    text: "Ratings 4.0+",
                                    isSelected: selectedFilter == "Ratings 4.0+"
                                ) {
                                    selectedFilter = "Ratings 4.0+"
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top, 10)
                        .padding(.top,10)
                        Text("400 restaurants to explore")
                            .font(.title3).bold()
                            .padding(.horizontal)
                        
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
                            
                            
                            RestaurantCardFull(
                                imageName: "Sandwich1",
                                name: "Charcoal Eats – Biryani & Beyond",
                                rating: "3.8 (60)",
                                location: "Vasai, 5.9 km",
                                cuisine: "Biryani, Kebabs",
                                price: "₹500 for two",
                                deliveryTime: "35–40 MINS",
                                tag: "Items at ₹199"
                            )
                            
                            
                            RestaurantCardFull(
                                imageName: "Dosa",
                                name: "Charcoal Eats – Biryani & Beyond",
                                rating: "3.8 (60)",
                                location: "Vasai, 5.9 km",
                                cuisine: "Biryani, Kebabs",
                                price: "₹500 for two",
                                deliveryTime: "35–40 MINS",
                                tag: "Items at ₹199"
                            )
                            RestaurantCardFull(
                                imageName: "Paratha",
                                name: "Charcoal Eats – Biryani & Beyond",
                                rating: "3.8 (60)",
                                location: "Vasai, 5.9 km",
                                cuisine: "Biryani, Kebabs",
                                price: "₹500 for two",
                                deliveryTime: "35–40 MINS",
                                tag: "Items at ₹199"
                            )
                            
                            
                            RestaurantCardFull(
                                imageName: "Sandwich1",
                                name: "Charcoal Eats – Biryani & Beyond",
                                rating: "3.8 (60)",
                                location: "Vasai, 5.9 km",
                                cuisine: "Biryani, Kebabs",
                                price: "₹500 for two",
                                deliveryTime: "35–40 MINS",
                                tag: "Items at ₹199"
                            )
                            
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
                                imageName: "biker",
                                name: "Charcoal Eats – Biryani & Beyond",
                                rating: "3.8 (60)",
                                location: "Vasai, 5.9 km",
                                cuisine: "Biryani, Kebabs",
                                price: "₹500 for two",
                                deliveryTime: "35–40 MINS",
                                tag: "Items at ₹199"
                            )
                            
                            
                            
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                    
                    
                }
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
    }
}

// MARK: - Reusable Components


struct CategoryTile: View {
    var name: String
    var price: String
    var image: String

    var body: some View {
        VStack(spacing: 8) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)

            Text(name)
                .font(.caption)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Text(price)
                .font(.caption2)
                .foregroundColor(.yellow)
        }
        .frame(width: 100)
    }
}





struct RestaurantCard: View {
    var name: String
    var category: String
    var rating: String
    var time: String
    var image: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 100)
                .clipped()
                .cornerRadius(10)

            Text(name)
                .bold()
                .lineLimit(1)

            HStack {
                Text("⭐️ \(rating)")
                Text("• \(time)")
            }
            .font(.caption)

            Text(category)
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
    }
}



struct FoodSuggestionItem: View {
    var name: String
    var image: String

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .clipped()

            Text(name)
                .font(.caption)
        }
    }
}

struct RestaurantCardFull: View {
    var imageName: String
    var name: String
    var rating: String
    var location: String
    var cuisine: String
    var price: String
    var deliveryTime: String
    var tag: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .clipped()
                    .cornerRadius(15)

                Text(deliveryTime)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(8)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                        .font(.caption)
                    Text("\(rating) • \(location)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Text("\(cuisine) • \(price)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 4) {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.orange)
                        .font(.caption)
                    Text(tag)
                        .font(.subheadline)
                        .foregroundColor(.orange)
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 4)
    }
}






struct FilterButton: View {
    var text: String
    var icon: String? = nil
    var isSelected: Bool
    var action: () -> Void // 👈 added action

    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
            }
            Text(text)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(isSelected ? Color.orange : Color.white) // 👈 highlight with orange
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .cornerRadius(20)
        .onTapGesture {
            action() // 👈 call the action when tapped
        }
    }
}


// MARK: - Preview

struct FoodDeliveryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDeliveryHomeView()
    }
}


