//
//  ShoppingItem.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//

import Foundation

struct ShoppingItem: Identifiable {
    let id: UUID
    var name: String
    var category: GroceryCategory
    var isPurchased: Bool
}

enum GroceryCategory: String, CaseIterable {
    case milk = "Milk", vegetables = "Vegetables", fruits = "Fruits", breads = "Breads", meats = "Meats"
    
    var icon: String {
        switch self {
        case .milk: return "🥛"
        case .vegetables: return "🥕"
        case .fruits: return "🍎"
        case .breads: return "🍞"
        case .meats: return "🥩"
        }
    }
}
