//
//  ShoppingRepository.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//
import Foundation
import RealmSwift

final class ShoppingRepository: ShoppingRepositoryProtocol {
    private let realm = try! Realm()

    func fetchItems() -> [ShoppingItem] {
        realm.objects(ShoppingRealmItem.self).map {
            ShoppingItem(id: $0.id, name: $0.name,
                               category: GroceryCategory(rawValue: $0.category) ?? .milk,
                               isPurchased: $0.isPurchased)
        }
    }

    func addItem(item: ShoppingItem) {
        let shoppingItem = ShoppingRealmItem()
        shoppingItem.id = item.id
        shoppingItem.name = item.name
        shoppingItem.category = item.category.rawValue
        shoppingItem.isPurchased = item.isPurchased
        try? realm.write {
            realm.add(shoppingItem)
        }
    }
    
    func updateItem(item: ShoppingItem) {
        guard let shoppingItem = realm.object(ofType: ShoppingRealmItem.self, forPrimaryKey: item.id) else { return }

        try? realm.write {
            shoppingItem.name = item.name
            shoppingItem.category = item.category.rawValue
            shoppingItem.isPurchased = item.isPurchased
        }
    }

    func deleteItem(id: UUID) {
        guard let shoppingItem = realm.object(ofType: ShoppingRealmItem.self, forPrimaryKey: id) else { return }

        try? realm.write {
            realm.delete(shoppingItem)
        }
    }
}

