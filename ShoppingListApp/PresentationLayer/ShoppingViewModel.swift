//
//  ShoppingViewModel.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//
import SwiftUI

@MainActor
final class ShoppingViewModel: ObservableObject {
    @Published private(set) var items: [ShoppingItem] = []
    @Published var itemName = ""
    @Published var selectedCategory: GroceryCategory = .milk
    @Published var filterCategory: GroceryCategory? = nil

    private let useCase: ShoppingUseCaseProtocol

    init(useCase: ShoppingUseCaseProtocol) {
        self.useCase = useCase
        loadItems()
    }
    
    var isAddButtonEnabled: Bool {
        !itemName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    func loadItems() {
        items = useCase.fetchItems()
    }

    func addItem() {
        let trimmedName = itemName.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedName.isEmpty else { return }
        
        useCase.addItem(name: trimmedName, category: selectedCategory)
        itemName = ""
        loadItems()
    }

    func togglePurchased(_ item: ShoppingItem) {
        var updated = item
        updated.isPurchased.toggle()
        useCase.updateItem(item: updated)
        loadItems()
    }

    func deleteItem(_ item: ShoppingItem) {
        useCase.deleteItem(id: item.id)
        loadItems()
    }

    func updateItem(_ item: ShoppingItem) {
        useCase.updateItem(item: item)
        loadItems()
    }

    // MARK: - Filtering
    var filteredItems: [ShoppingItem] {
        guard let filterCategory else { return items }
        return items.filter { $0.category == filterCategory }
    }

    // MARK: - Grouping
    var groupedItems: [GroceryCategory: [ShoppingItem]] {
        Dictionary(grouping: filteredItems, by: { $0.category })
    }
}


