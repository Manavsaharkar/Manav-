//
//  CashbackOfferView.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct CashbackOfferView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with title and close button
            HStack {
                Text("Extra 10% cashback")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
            }
            
            // Subtitle
            Text("WITH SWIGGY HDFC CARD | ABOVE ₹100")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            
            // Main content
            VStack(alignment: .leading, spacing: 12) {
                Text("Extra 10% cashback with HDFC card")
                    .font(.system(size: 16, weight: .semibold))
                
                VStack(alignment: .leading, spacing: 8) {
                    Label("Valid only on Swiggy HDFC Bank Credit Card", systemImage: "circle.fill")
                        .labelStyle(BulletLabelStyle())
                    
                    Label("Applicable on a minimum net transaction value of ₹100", systemImage: "circle.fill")
                        .labelStyle(BulletLabelStyle())
                    
                    Label("Monthly cashback limit of ₹1500 on Swiggy spends", systemImage: "circle.fill")
                        .labelStyle(BulletLabelStyle())
                }
                .font(.system(size: 14))
                .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct BulletLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 8) {
            configuration.icon
                .font(.system(size: 6))
                .foregroundColor(.gray)
                .padding(.top, 6)
            configuration.title
        }
    }
}

struct CashbackOfferView_Previews: PreviewProvider {
    static var previews: some View {
        CashbackOfferView()
    }
}

//
//import SwiftUI
//
//struct ParentView: View {
//    @State private var showOffer = false
//
//    var body: some View {
//        VStack {
//            Button("Show Cashback Offer") {
//                showOffer = true
//            }
//            .padding()
//            .font(.title2)
//        }
//        .sheet(isPresented: $showOffer) {
//            CashbackOfferView()
//        }
//    }
//}
//
//struct CashbackOfferView: View {
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            // Header with title and close button
//            HStack {
//                Text("Extra 10% cashback")
//                    .font(.system(size: 20, weight: .semibold))
//                Spacer()
//                Image(systemName: "xmark")
//                    .font(.system(size: 18))
//                    .foregroundColor(.black)
//                    .onTapGesture {
//                        dismiss()
//                    }
//            }
//
//            // Subtitle
//            Text("WITH SWIGGY HDFC CARD | ABOVE ₹100")
//                .font(.system(size: 14))
//                .foregroundColor(.gray)
//
//            Divider()
//
//            // Main content
//            VStack(alignment: .leading, spacing: 12) {
//                Text("Extra 10% cashback with HDFC card")
//                    .font(.system(size: 16, weight: .semibold))
//
//                VStack(alignment: .leading, spacing: 8) {
//                    Label("Valid only on Swiggy HDFC Bank Credit Card", systemImage: "circle.fill")
//                        .labelStyle(BulletLabelStyle())
//
//                    Label("Applicable on a minimum net transaction value of ₹100", systemImage: "circle.fill")
//                        .labelStyle(BulletLabelStyle())
//
//                    Label("Monthly cashback limit of ₹1500 on Swiggy spends", systemImage: "circle.fill")
//                        .labelStyle(BulletLabelStyle())
//                }
//                .font(.system(size: 14))
//                .foregroundColor(.black)
//            }
//
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct BulletLabelStyle: LabelStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        HStack(alignment: .top, spacing: 8) {
//            configuration.icon
//                .font(.system(size: 6))
//                .foregroundColor(.gray)
//                .padding(.top, 6)
//            configuration.title
//        }
//    }
//}
//
//#Preview {
//    ParentView()
//}
