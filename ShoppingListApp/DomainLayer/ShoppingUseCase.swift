//
//  AddShoppingItemUseCase.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//
import Foundation

final class ShoppingUseCase: ShoppingUseCaseProtocol {
    private let repository: ShoppingRepository

    init(repository: ShoppingRepository) {
        self.repository = repository
    }

    func fetchItems() -> [ShoppingItem] {
        repository.fetchItems()
    }

    func addItem(name: String, category: GroceryCategory) {
        let item = ShoppingItem(
            id: UUID(),
            name: name,
            category: category,
            isPurchased: false
        )
        repository.addItem(item: item)
    }

    func updateItem(item: ShoppingItem) {
        repository.updateItem(item: item)
    }

    func deleteItem(id: UUID) {
        repository.deleteItem(id: id)
    }
}
