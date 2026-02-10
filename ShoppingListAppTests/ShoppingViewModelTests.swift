//
//  ShoppingListAppTests.swift
//  ShoppingListAppTests
//
//  Created by Rishabh Gupta on 10/02/26.
//
import XCTest
@testable import ShoppingListApp

@MainActor
final class ShoppingViewModelTests: XCTestCase {

    var useCase: MockShoppingUseCase!
    var viewModel: ShoppingViewModel!

    override func setUp() {
        super.setUp()
        useCase = MockShoppingUseCase()
        viewModel = ShoppingViewModel(useCase: useCase)
    }

    override func tearDown() {
        useCase = nil
        viewModel = nil
        super.tearDown()
    }

    func testAddItem() {
        viewModel.itemName = "Milk"
        viewModel.selectedCategory = .milk
        viewModel.addItem()

        XCTAssertEqual(viewModel.items.count, 1)
        XCTAssertEqual(viewModel.items.first?.name, "Milk")
        XCTAssertEqual(viewModel.items.first?.category, .milk)
        XCTAssertFalse(viewModel.items.first!.isPurchased)
    }

    func testDeleteItem() {
        viewModel.itemName = "Bread"
        viewModel.selectedCategory = .breads
        viewModel.addItem()

        let item = viewModel.items.first!
        viewModel.deleteItem(item)

        XCTAssertTrue(viewModel.items.isEmpty)
    }

    func testTogglePurchased() {
        viewModel.itemName = "Eggs"
        viewModel.selectedCategory = .milk
        viewModel.addItem()

        let item = viewModel.items.first!
        XCTAssertFalse(item.isPurchased)

        viewModel.togglePurchased(item)
        XCTAssertTrue(viewModel.items.first!.isPurchased)

        viewModel.togglePurchased(item)
        XCTAssertFalse(viewModel.items.first!.isPurchased)
    }

    func testUpdateItem() {
        viewModel.itemName = "Apple"
        viewModel.selectedCategory = .fruits
        viewModel.addItem()

        var item = viewModel.items.first!
        item.name = "Green Apple"
        item.category = .fruits
        viewModel.updateItem(item)

        XCTAssertEqual(viewModel.items.first?.name, "Green Apple")
    }

    func testFilteringByCategory() {
        viewModel.itemName = "Milk"
        viewModel.selectedCategory = .milk
        viewModel.addItem()

        viewModel.itemName = "Bread"
        viewModel.selectedCategory = .breads
        viewModel.addItem()

        viewModel.filterCategory = .milk
        XCTAssertEqual(viewModel.filteredItems.count, 1)
        XCTAssertEqual(viewModel.filteredItems.first?.category, .milk)

        viewModel.filterCategory = .breads
        XCTAssertEqual(viewModel.filteredItems.count, 1)
        XCTAssertEqual(viewModel.filteredItems.first?.category, .breads)

        viewModel.filterCategory = nil
        XCTAssertEqual(viewModel.filteredItems.count, 2)
    }

    func testGroupedItems() {
        viewModel.itemName = "Milk"
        viewModel.selectedCategory = .milk
        viewModel.addItem()

        viewModel.itemName = "Cheese"
        viewModel.selectedCategory = .milk
        viewModel.addItem()

        viewModel.itemName = "Bread"
        viewModel.selectedCategory = .breads
        viewModel.addItem()

        let grouped = viewModel.groupedItems
        XCTAssertEqual(grouped[.milk]?.count, 2)
        XCTAssertEqual(grouped[.breads]?.count, 1)
    }
    
    func testDeleteNonExistentItemDoesNothing() {
        let fakeID = UUID()
        viewModel.deleteItem(ShoppingItem(id: fakeID, name: "Fake", category: .milk, isPurchased: false))

        // List should still be empty
        XCTAssertTrue(viewModel.items.isEmpty)
    }
    
    func testAddItemWithWhitespaceDoesNothing() {
        viewModel.itemName = "   " // only spaces
        viewModel.addItem()

        XCTAssertTrue(viewModel.items.isEmpty, "Adding item with only whitespace should be ignored")
    }
}
