//
//  AddToCartView.swift
//  Job Potrol
//
//  Created by Manav on 20/04/25.
//

import Foundation
import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    var quantity: Int
}

struct AddToCartView: View {
    @State private var cartItems: [CartItem] = [
        CartItem(name: "Paneer Butter Masala", price: 250, quantity: 1),
        CartItem(name: "Butter Naan", price: 50, quantity: 2),
        CartItem(name: "Gulab Jamun", price: 100, quantity: 1)
    ]
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(cartItems.indices, id: \.self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(cartItems[index].name)
                                .font(.headline)
                            Text("₹\(cartItems[index].price, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                        Spacer()
                        HStack {
                            Button(action: {
                                if cartItems[index].quantity > 0 {
                                    cartItems[index].quantity -= 1
                                }
                            }) {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(.red)
                                    .font(.title2)
                            }
                            
                            Text("\(cartItems[index].quantity)")
                                .frame(width: 30)
                            
                            Button(action: {
                                cartItems[index].quantity += 1
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.green)
                                    .font(.title2)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            
            VStack {
                HStack {
                    Text("Total:")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("₹\(totalPrice, specifier: "%.2f")")
                        .font(.title2)
                        .bold()
                }
                .padding()
                
                Button(action: {
                    // Navigate to Checkout
                }) {
                    Text("Proceed to Checkout")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
        .navigationTitle("Cart")
    }
}

struct AddToCartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToCartView()
        }
    }
}
