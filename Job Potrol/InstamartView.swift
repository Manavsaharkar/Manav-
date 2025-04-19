//
//  InstamartView.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//


//import SwiftUI
//
//struct InstamartView: View {
//    
//    struct Product: Identifiable {
//        let id = UUID()
//        let name: String
//        let price: String
//        let imageName: String
//        let discount: String
//    }
//    
//    let categories = ["Fruits", "Vegetables", "Dairy", "Snacks", "Beverages", "Bakery"]
//    
//    let products = [
//        Product(name: "Fresh Apple", price: "₹120/kg", imageName: "applelogo", discount: "10% OFF"),
//        Product(name: "Banana", price: "₹60/dozen", imageName: "leaf", discount: "5% OFF"),
//        Product(name: "Tomato", price: "₹30/kg", imageName: "flame.fill", discount: "12% OFF"),
//        Product(name: "Milk", price: "₹50/litre", imageName: "drop.fill", discount: "8% OFF"),
//        Product(name: "Chips", price: "₹20/pack", imageName: "bag.fill", discount: "15% OFF"),
//        Product(name: "Juice", price: "₹80/bottle", imageName: "cart.fill", discount: "7% OFF"),
//        Product(name: "Cheese", price: "₹250/500g", imageName: "cube.box.fill", discount: "6% OFF")
//    ]
//    
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    @State private var searchText = ""
//    @State private var quantities: [UUID: Int] = [:]
//    @State private var favoriteProducts: Set<UUID> = []
//    @Namespace var animation
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            
//            // Search Bar
//            HStack {
//                Image(systemName: "magnifyingglass")
//                    .foregroundColor(.gray)
//                TextField("Search for products", text: $searchText)
//                    .textFieldStyle(PlainTextFieldStyle())
//            }
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(10)
//            .padding(.horizontal)
//            .padding(.top)
//            
//            // Categories
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 16) {
//                    ForEach(categories, id: \.self) { category in
//                        Text(category)
//                            .font(.subheadline)
//                            .padding(.vertical, 8)
//                            .padding(.horizontal, 16)
//                            .background(Color.orange.opacity(0.2))
//                            .cornerRadius(20)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top, 10)
//            }
//            
//            // Section Title
//            Text("Popular Products")
//                .font(.title2)
//                .bold()
//                .padding(.horizontal)
//                .padding(.top, 10)
//            
//            // Grid View
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(products.filter {
//                        searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
//                    }) { product in
//                        VStack(alignment: .leading, spacing: 10) {
//                            
//                            ZStack(alignment: .topTrailing) {
//                                // Product Image
//                                RoundedRectangle(cornerRadius: 12)
//                                    .fill(Color.orange.opacity(0.1))
//                                    .frame(height: 130)
//                                    .overlay(
//                                        Image(systemName: product.imageName)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 60, height: 60)
//                                            .foregroundColor(.orange)
//                                    )
//                                
//                                // Favorite Heart Button
//                                Button(action: {
//                                    toggleFavorite(product)
//                                }) {
//                                    Image(systemName: favoriteProducts.contains(product.id) ? "heart.fill" : "heart")
//                                        .padding(8)
//                                        .foregroundColor(favoriteProducts.contains(product.id) ? .red : .gray)
//                                }
//                            }
//                            
//                            // Discount Badge
//                            Text(product.discount)
//                                .font(.caption2)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .padding(5)
//                                .background(Color.red)
//                                .cornerRadius(5)
//                            
//                            // Product Name
//                            Text(product.name)
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            
//                            // Product Price
//                            Text(product.price)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                            
//                            // Add to Cart or Quantity Stepper
//                            if let quantity = quantities[product.id], quantity > 0 {
//                                HStack {
//                                    Button(action: {
//                                        decreaseQuantity(for: product)
//                                    }) {
//                                        Image(systemName: "minus.circle.fill")
//                                            .foregroundColor(.orange)
//                                    }
//                                    Text("\(quantity)")
//                                        .font(.headline)
//                                        .padding(.horizontal, 8)
//                                    Button(action: {
//                                        increaseQuantity(for: product)
//                                    }) {
//                                        Image(systemName: "plus.circle.fill")
//                                            .foregroundColor(.orange)
//                                    }
//                                }
//                                .padding(.top, 5)
//                            } else {
//                                Button(action: {
//                                    addToCart(product)
//                                }) {
//                                    Text("Add to Cart")
//                                        .font(.subheadline)
//                                        .fontWeight(.bold)
//                                        .frame(maxWidth: .infinity)
//                                        .padding(.vertical, 8)
//                                        .background(Color.orange)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(8)
//                                }
//                                .padding(.top, 5)
//                                .matchedGeometryEffect(id: product.id, in: animation)
//                            }
//                            
//                        }
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(15)
//                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 4)
//                    }
//                }
//                .padding()
//            }
//        }
//        .background(Color(.systemGroupedBackground).ignoresSafeArea())
//    }
//    
//    // MARK: Functions
//    private func addToCart(_ product: Product) {
//        quantities[product.id] = 1
//    }
//    
//    private func increaseQuantity(for product: Product) {
//        quantities[product.id, default: 1] += 1
//    }
//    
//    private func decreaseQuantity(for product: Product) {
//        if let quantity = quantities[product.id], quantity > 1 {
//            quantities[product.id] = quantity - 1
//        } else {
//            quantities[product.id] = nil
//        }
//    }
//    
//    private func toggleFavorite(_ product: Product) {
//        if favoriteProducts.contains(product.id) {
//            favoriteProducts.remove(product.id)
//        } else {
//            favoriteProducts.insert(product.id)
//        }
//    }
//}
//
//struct InstamartView_Previews: PreviewProvider {
//    static var previews: some View {
//        InstamartView()
//    }
//}
import SwiftUI

struct InstamartView: View {
    
    struct Product: Identifiable {
        let id = UUID()
        let name: String
        let price: String
        let originalPrice: String
        let imageName: String
        let discount: String
        let category: String
        let rating: Double
    }
    
    let categories = ["All", "Fruits", "Vegetables", "Dairy", "Snacks", "Beverages", "Bakery"]
    
    let products = [
        // Fruits
        Product(name: "Fresh Apple", price: "₹120/kg", originalPrice: "₹140", imageName: "applelogo", discount: "10% OFF", category: "Fruits", rating: 4.5),
        Product(name: "Banana", price: "₹60/dozen", originalPrice: "₹80", imageName: "leaf", discount: "5% OFF", category: "Fruits", rating: 4.2),
        Product(name: "Mango", price: "₹150/kg", originalPrice: "₹180", imageName: "mappin.and.ellipse", discount: "20% OFF", category: "Fruits", rating: 4.7),
        Product(name: "Pineapple", price: "₹90/kg", originalPrice: "₹100", imageName: "star.fill", discount: "10% OFF", category: "Fruits", rating: 4.4),
        
        // Vegetables
        Product(name: "Tomato", price: "₹30/kg", originalPrice: "₹40", imageName: "flame.fill", discount: "12% OFF", category: "Vegetables", rating: 4.0),
        Product(name: "Cucumber", price: "₹25/kg", originalPrice: "₹35", imageName: "leaf.fill", discount: "15% OFF", category: "Vegetables", rating: 4.3),
        Product(name: "Carrot", price: "₹40/kg", originalPrice: "₹50", imageName: "circle.fill", discount: "10% OFF", category: "Vegetables", rating: 4.6),
        Product(name: "Onion", price: "₹45/kg", originalPrice: "₹55", imageName: "square.fill", discount: "8% OFF", category: "Vegetables", rating: 4.2),
        
        // Dairy
        Product(name: "Milk", price: "₹50/litre", originalPrice: "₹55", imageName: "drop.fill", discount: "8% OFF", category: "Dairy", rating: 4.8),
        Product(name: "Butter", price: "₹120/200g", originalPrice: "₹130", imageName: "cube.box.fill", discount: "7% OFF", category: "Dairy", rating: 4.6),
        Product(name: "Cheese", price: "₹250/500g", originalPrice: "₹270", imageName: "cube.box.fill", discount: "6% OFF", category: "Dairy", rating: 4.5),
        Product(name: "Curd", price: "₹40/500g", originalPrice: "₹50", imageName: "circle.fill", discount: "15% OFF", category: "Dairy", rating: 4.3),
        Product(name: "Ghee", price: "₹350/1kg", originalPrice: "₹400", imageName: "goforward", discount: "12% OFF", category: "Dairy", rating: 4.7),
        
        // Snacks
        Product(name: "Chips", price: "₹20/pack", originalPrice: "₹25", imageName: "bag.fill", discount: "15% OFF", category: "Snacks", rating: 3.9),
        Product(name: "Biscuits", price: "₹25/pack", originalPrice: "₹30", imageName: "tray.2.fill", discount: "10% OFF", category: "Snacks", rating: 4.1),
        Product(name: "Popcorn", price: "₹40/pack", originalPrice: "₹50", imageName: "square.fill", discount: "5% OFF", category: "Snacks", rating: 4.0),
        Product(name: "Nuts Mix", price: "₹150/250g", originalPrice: "₹180", imageName: "applelogo", discount: "15% OFF", category: "Snacks", rating: 4.2),
        Product(name: "Chocolate Bar", price: "₹30/bar", originalPrice: "₹40", imageName: "archivebox.fill", discount: "25% OFF", category: "Snacks", rating: 4.6),
        
        // Beverages
        Product(name: "Coffee", price: "₹200/250g", originalPrice: "₹220", imageName: "cup.and.saucer.fill", discount: "10% OFF", category: "Beverages", rating: 4.7),
        Product(name: "Juice", price: "₹80/bottle", originalPrice: "₹90", imageName: "cart.fill", discount: "7% OFF", category: "Beverages", rating: 4.1),
        Product(name: "Green Tea", price: "₹100/box", originalPrice: "₹120", imageName: "leaf.fill", discount: "15% OFF", category: "Beverages", rating: 4.4),
        
        // Bakery
        Product(name: "Croissant", price: "₹50/pack", originalPrice: "₹60", imageName: "bread.fill", discount: "10% OFF", category: "Bakery", rating: 4.5),
        Product(name: "Cake", price: "₹350/500g", originalPrice: "₹400", imageName: "cake.fill", discount: "12% OFF", category: "Bakery", rating: 4.8),
        Product(name: "Bread", price: "₹40/loaf", originalPrice: "₹50", imageName: "bag.fill", discount: "20% OFF", category: "Bakery", rating: 4.2),
        Product(name: "Cupcake", price: "₹100/pack", originalPrice: "₹120", imageName: "cupcake.fill", discount: "8% OFF", category: "Bakery", rating: 4.7),
        Product(name: "Donut", price: "₹30/pack", originalPrice: "₹40", imageName: "circle.fill", discount: "15% OFF", category: "Bakery", rating: 4.6),
        Product(name: "Puff", price: "₹25/pack", originalPrice: "₹30", imageName: "star.fill", discount: "5% OFF", category: "Bakery", rating: 4.3),
        Product(name: "Muffin", price: "₹70/pack", originalPrice: "₹90", imageName: "circle.fill", discount: "10% OFF", category: "Bakery", rating: 4.4),
        Product(name: "Baguette", price: "₹90/loaf", originalPrice: "₹110", imageName: "square.fill", discount: "18% OFF", category: "Bakery", rating: 4.5),
        Product(name: "Roll", price: "₹40/pack", originalPrice: "₹50", imageName: "archivebox.fill", discount: "5% OFF", category: "Bakery", rating: 4.2),
        Product(name: "Bagel", price: "₹60/pack", originalPrice: "₹70", imageName: "rectangle.fill", discount: "10% OFF", category: "Bakery", rating: 4.3)
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    @State private var quantities: [UUID: Int] = [:]
    @State private var favoriteProducts: Set<UUID> = []
    @State private var cartItems: [UUID: Int] = [:]
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Search Bar with Clear Button
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search for products", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top)
            
            // Categories with Smooth Transition
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            withAnimation {
                                selectedCategory = category
                            }
                        }) {
                            Text(category)
                                .font(.subheadline)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedCategory == category ? Color.orange : Color.orange.opacity(0.2))
                                .foregroundColor(selectedCategory == category ? .white : .black)
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            }
            
            // Section Title
            Text(selectedCategory == "All" ? "Popular Products" : selectedCategory)
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .padding(.top, 10)
            
            // Grid View of Products
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredProducts) { product in
                        VStack(alignment: .leading, spacing: 10) {
                            ZStack(alignment: .topTrailing) {
                                // Product Image
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.orange.opacity(0.1))
                                    .frame(height: 130)
                                    .overlay(
                                        Image(systemName: product.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(.orange)
                                    )
                                
                                // Favorite Heart Button
                                Button(action: {
                                    toggleFavorite(product)
                                }) {
                                    Image(systemName: favoriteProducts.contains(product.id) ? "heart.fill" : "heart")
                                        .padding(8)
                                        .foregroundColor(favoriteProducts.contains(product.id) ? .red : .gray)
                                }
                            }
                            
                            // Rating and Discount
                            HStack {
                                ForEach(0..<5) { index in
                                    Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                Text(product.discount)
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .cornerRadius(5)
                            }
                            
                            // Product Name
                            Text(product.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            // Price and Original Price
                            HStack {
                                Text(product.price)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Text("₹\(product.originalPrice)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .strikethrough()
                            }
                            
                            // Add to Cart or Quantity Stepper
                            if let quantity = quantities[product.id], quantity > 0 {
                                HStack {
                                    Button(action: {
                                        decreaseQuantity(for: product)
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.orange)
                                    }
                                    Text("\(quantity)")
                                        .font(.headline)
                                        .padding(.horizontal, 8)
                                    Button(action: {
                                        increaseQuantity(for: product)
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.orange)
                                    }
                                }
                                .padding(.top, 5)
                            } else {
                                Button(action: {
                                    addToCart(product)
                                }) {
                                    Text("Add to Cart")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                .padding(.top, 5)
                                .matchedGeometryEffect(id: product.id, in: animation)
                            }
                            
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 4)
                    }
                }
                .padding()
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
    
    // MARK: Computed property for filtered products
    private var filteredProducts: [Product] {
        products.filter { product in
            (selectedCategory == "All" || product.category == selectedCategory) &&
            (searchText.isEmpty || product.name.localizedCaseInsensitiveContains(searchText))
        }
    }
    
    // MARK: Functions
    private func addToCart(_ product: Product) {
        quantities[product.id] = 1
        cartItems[product.id, default: 0] += 1
    }
    
    private func increaseQuantity(for product: Product) {
        quantities[product.id, default: 1] += 1
    }
    
    private func decreaseQuantity(for product: Product) {
        if let quantity = quantities[product.id], quantity > 1 {
            quantities[product.id] = quantity - 1
        } else {
            quantities[product.id] = nil
        }
    }
    
    private func toggleFavorite(_ product: Product) {
        if favoriteProducts.contains(product.id) {
            favoriteProducts.remove(product.id)
        } else {
            favoriteProducts.insert(product.id)
        }
    }
}

struct InstamartView_Previews: PreviewProvider {
    static var previews: some View {
        InstamartView()
    }
}
