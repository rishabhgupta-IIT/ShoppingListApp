//
//  ShoppingUseCaseProtocol.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//
import Foundation

protocol ShoppingUseCaseProtocol {
    func fetchItems() -> [ShoppingItem]
    func addItem(name: String, category: GroceryCategory)
    func updateItem(item: ShoppingItem)
    func deleteItem(id: UUID)
}

