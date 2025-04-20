//
//  FamliyFrad.swift
//  Job Potrol
//
//  Created by Manav on 18/04/25.
//

import Foundation
import SwiftUI

struct FamilyFriendScreen: View {
    
    let categories = [
        ("Family", "house.fill"),
        ("Friends", "person.3.fill"),
        ("Kids", "figure.and.child.holdinghands"),
        ("Grandparents", "person.2.square.stack.fill"),
        ("Cousins", "person.crop.circle.badge.checkmark"),
        ("Best Friends", "person.crop.circle.badge.plus")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(categories, id: \.0) { category in
                        VStack {
                            Image(systemName: category.1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)
                                .padding()

                            Text(category.0)
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .frame(width: 160, height: 160)
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .navigationTitle("Family & Friends")
        }
    }
}

struct FamilyFriendScreen_Previews: PreviewProvider {
    static var previews: some View {
        FamilyFriendScreen()
    }
}
