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
        let uiModel = CategoryUIMapper.map(category)

        Button(action: action) {
            VStack {
                Text(uiModel.icon).font(.title2)
                Text(uiModel.displayName).font(.system(size: 10))
            }
            .frame(width: 60, height: 70)
            .background(isSelected ? uiModel.color : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .primary)
            .cornerRadius(10)
        }
    }
}
