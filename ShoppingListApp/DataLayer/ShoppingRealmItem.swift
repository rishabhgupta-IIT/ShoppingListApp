//
//  ShoppingRealmItem.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//
import Foundation
import RealmSwift

class ShoppingRealmItem: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var name: String
    @Persisted var category: String
    @Persisted var isPurchased: Bool
}
