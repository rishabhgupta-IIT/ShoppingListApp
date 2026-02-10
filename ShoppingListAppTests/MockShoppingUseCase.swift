//
//  MockShoppingUseCase.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//

import Foundation
@testable import ShoppingListApp

final class MockShoppingUseCase: ShoppingUseCaseProtocol {
    var items: [ShoppingItem] = []

    func fetchItems() -> [ShoppingItem] {
        return items
    }

    func addItem(name: String, category: GroceryCategory) {
        let item = ShoppingItem(id: UUID(), name: name, category: category, isPurchased: false)
        items.append(item)
    }

    func updateItem(item: ShoppingItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item
        }
    }

    func deleteItem(id: UUID) {
        items.removeAll { $0.id == id }
    }
}
