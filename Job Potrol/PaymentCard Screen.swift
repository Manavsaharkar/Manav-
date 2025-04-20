//
//  PaymentCard Screen.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

// Model for a payment card
struct PaymentCard: Identifiable {
    let id = UUID()
    let cardHolder: String
    let cardNumber: String
    let expiryDate: String
    let cardTypeImageName: String // e.g., "visa", "mastercard"
}

// Sample data
let sampleCards: [PaymentCard] = [
    PaymentCard(cardHolder: "John Doe", cardNumber: "**** **** **** 1234", expiryDate: "12/24", cardTypeImageName: "visa"),
    PaymentCard(cardHolder: "Jane Smith", cardNumber: "**** **** **** 5678", expiryDate: "08/25", cardTypeImageName: "mastercard")
]

// Payment Card Row View
struct PaymentCardRow: View {
    let card: PaymentCard
    let isSelected: Bool

    var body: some View {
        HStack {
            Image(card.cardTypeImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)

            VStack(alignment: .leading, spacing: 4) {
                Text(card.cardNumber)
                    .font(.headline)
                Text("Expires \(card.expiryDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()

            // Radio button indicating selection
            Circle()
                .stroke(isSelected ? Color.blue : Color.gray, lineWidth: 2)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .fill(isSelected ? Color.blue : Color.clear)
                        .frame(width: 12, height: 12)
                )
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// Main View for selecting payment card
struct PaymentCardOptionView: View {
    @State private var cards: [PaymentCard] = sampleCards
    @State private var selectedCardID: UUID? = sampleCards.first?.id

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(cards) { card in
                            PaymentCardRow(card: card, isSelected: card.id == selectedCardID)
                                .onTapGesture {
                                    selectedCardID = card.id
                                }
                        }
                    }
                    .padding()
                }

                Button(action: addNewCard) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                        Text("Add New Card")
                            .font(.headline)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Select Card")
        }
    }

    private func addNewCard() {
        // Action to add a new card. Could present a sheet or navigate to AddCardView.
        // For now, appending a dummy card
        let newCard = PaymentCard(cardHolder: "New User", cardNumber: "**** **** **** 0000", expiryDate: "10/26", cardTypeImageName: "visa")
        cards.append(newCard)
    }
}

// Preview
struct PaymentCardOptionView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCardOptionView()
    }
}

