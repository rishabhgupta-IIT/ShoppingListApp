//
//  ShoppingRepositoryProtocol.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//

import Foundation

protocol ShoppingRepositoryProtocol {
    func fetchItems() -> [ShoppingItem]
    func addItem(item: ShoppingItem)
    func updateItem(item: ShoppingItem)
    func deleteItem(id: UUID)
}

