//
//  CategoryUIMapper.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//

import SwiftUI
import Foundation

final class CategoryUIMapper {
    static func map(_ category: GroceryCategory) -> CategoryUIModel {
        switch category {
        case .milk:
            return CategoryUIModel(icon: "🥛", color: Color.blue, displayName: category.rawValue)
        case .vegetables:
            return CategoryUIModel(icon: "🥕", color: Color.green, displayName: category.rawValue)
        case .fruits:
            return CategoryUIModel(icon: "🍎", color: Color.red, displayName: category.rawValue)
        case .breads:
            return CategoryUIModel(icon: "🍞", color: Color.yellow, displayName: category.rawValue)
        case .meats:
            return CategoryUIModel(icon: "🥩", color: Color.pink, displayName: category.rawValue)
        }
    }
}
