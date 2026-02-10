//
//  CategoryButton.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//
import SwiftUI

struct CategoryButton: View {
    let category: GroceryCategory
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Text(category.icon).font(.title2)
                Text(category.rawValue.prefix(6)).font(.system(size: 10))
            }
            .frame(width: 60, height: 70)
            .background(isSelected ? Color.blue : Color.red.opacity(0.05))
            .foregroundColor(isSelected ? .white : .red)
            .cornerRadius(10)
        }
    }
}
