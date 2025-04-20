//
//  OfferScreen .swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//
//import Foundation
//import SwiftUI
//
//struct OfferScreen: View {
//    var body: some View {
//        ScrollView {
//            
//            VStack(spacing: 20) {
//                
//                // Title
//                Text("Offers for You")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal)
//                    .padding(.top)
//                
//                // Special Offers Section
//                SectionHeader(title: "Special Offers")
//                
//                ForEach(offers, id: \.id) { offer in
//                    OfferCard(offer: offer)
//                        .padding(.horizontal)
//                }
//                
//                // Trending Offers Section
//                SectionHeader(title: "Trending Offers")
//                
//                ForEach(offers1, id: \.id) { offer in
//                    OfferCard(offer: offer)
//                        .padding(.horizontal)
//                }
//                
//                // New Offers Section
//                SectionHeader(title: "New Arrivals")
//                
//                ForEach(offers, id: \.id) { offer in
//                    OfferCard(offer: offer)
//                        .padding(.horizontal)
//                }
//            }
//        }
//        .background(Color(.systemGroupedBackground))
//        .navigationTitle("Offers")
//    }
//}
//
//struct SectionHeader: View {
//    let title: String
//    
//    var body: some View {
//        Text(title)
//            .font(.title2)
//            .fontWeight(.semibold)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.horizontal)
//            .padding(.top)
//    }
//}
//
//struct Offer: Identifiable {
//    let id = UUID()
//    let title: String
//    let description: String
//    let code: String
//}
//
//
//let offers = [
//    Offer(title: "50% OFF on First Order", description: "Get flat 50% off up to ₹100 on your first order!", code: "FIRST50"),
//    Offer(title: "₹75 OFF on Orders above ₹299", description: "Save ₹75 when you spend ₹299 or more.", code: "SAVE75"),
//    Offer(title: "Free Delivery for 7 Days", description: "Enjoy unlimited free deliveries with Swiggy Super!", code: "SUPERFREE"),
//    Offer(title: "20% Cashback with PayTM", description: "Use PayTM wallet and get 20% cashback.", code: "PAYTM20")
//]
//
//let offers1 = [
//    Offer(title: "20% Cashback", description: "Pay via PayTM and save.", code: "PAYTM20"),
//    Offer(title: "Flat ₹100 OFF", description: "Minimum order ₹499", code: "BIGSAVE"),
//    Offer(title: "Weekend Blast", description: "Flat discounts all weekend.", code: "WEEKEND")
//]
//
//struct OfferCard: View {
//    let offer: Offer
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text(offer.title)
//                .font(.headline)
//                .foregroundColor(.black)
//            
//            Text(offer.description)
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            
//            HStack {
//                Spacer()
//                Text(offer.code)
//                    .font(.caption)
//                    .fontWeight(.bold)
//                    .padding(.vertical, 6)
//                    .padding(.horizontal, 12)
//                    .background(Color.orange)
//                    .foregroundColor(.white)
//                    .cornerRadius(12)
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(16)
//        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
//    }
//}
//
//struct OfferCardScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferScreen()
//    }
//}
//
//
//
//


import SwiftUI

// MARK: - OfferScreen
struct OfferScreen: View {
    var body: some View {
        NavigationView {  // Add NavigationView here
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Title
                    Text("Offers for You")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    // Special Offers Section
                    SectionHeader(title: "Special Offers")
                    
                    ForEach(offers, id: \.id) { offer in
                        NavigationLink(destination: PaymentOptionsView()) {  // Wrap OfferCard inside NavigationLink
                            OfferCard(offer: offer)
                                .padding(.horizontal)
                        }
                    }
                    
                    // Trending Offers Section
                    SectionHeader(title: "Trending Offers")
                    
                    ForEach(offers1, id: \.id) { offer in
                        NavigationLink(destination: PaymentOptionsView()) {
                            OfferCard(offer: offer)
                                .padding(.horizontal)
                        }
                    }
                    
                    // New Offers Section
                    SectionHeader(title: "New Arrivals")
                    
                    ForEach(offers, id: \.id) { offer in
                        NavigationLink(destination: PaymentOptionsView()) {
                            OfferCard(offer: offer)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Offers")
        }
    }
}

// MARK: - SectionHeader
struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top)
    }
}

// MARK: - Offer Model
struct Offer: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let code: String
}

// MARK: - OfferCard
struct OfferCard: View {
    let offer: Offer
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(offer.title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(offer.description)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Spacer()
                Text(offer.code)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}

// MARK: - Dummy Offers Data
let offers = [
    Offer(title: "50% OFF on First Order", description: "Get flat 50% off up to ₹100 on your first order!", code: "FIRST50"),
    Offer(title: "₹75 OFF on Orders above ₹299", description: "Save ₹75 when you spend ₹299 or more.", code: "SAVE75"),
    Offer(title: "Free Delivery for 7 Days", description: "Enjoy unlimited free deliveries with Swiggy Super!", code: "SUPERFREE"),
    Offer(title: "20% Cashback with PayTM", description: "Use PayTM wallet and get 20% cashback.", code: "PAYTM20")
]

let offers1 = [
    Offer(title: "20% Cashback", description: "Pay via PayTM and save.", code: "PAYTM20"),
    Offer(title: "Flat ₹100 OFF", description: "Minimum order ₹499", code: "BIGSAVE"),
    Offer(title: "Weekend Blast", description: "Flat discounts all weekend.", code: "WEEKEND")
]


// MARK: - Preview
struct OfferCardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OfferScreen()
    }
}
