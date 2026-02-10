//
//  GroceryListView.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//
import SwiftUI

struct GroceryListView: View {
    @StateObject var viewModel: ShoppingViewModel
    @State private var editingItem: ShoppingItem? = nil
    @State private var editedName: String = ""
    @State private var editedCategory: GroceryCategory = .milk

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header Image & Title
                Image(systemName: "cart.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                    .clipShape(Circle())
                    .padding(.top)

                Text("Grocery List")
                    .font(.title.bold())
                Text("Add items to your shopping list")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                // Input Card - Add Item
                VStack(alignment: .leading, spacing: 15) {
                    Text("Add New Item")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Item Name").font(.caption.bold())
                        TextField("Enter grocery item..", text: $viewModel.itemName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)

                        Text("Category").font(.caption.bold())
                        HStack {
                            ForEach(GroceryCategory.allCases, id: \.self) { cat in
                                CategoryButton(category: cat, isSelected: viewModel.selectedCategory == cat) {
                                    viewModel.selectedCategory = cat
                                }
                            }
                        }

                        Button(action: viewModel.addItem) {
                            Label("Add Item", systemImage: "plus")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray2))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding()

                // Filter by Category
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button("All") { viewModel.filterCategory = nil }
                            .buttonStyle(.bordered)

                        ForEach(GroceryCategory.allCases, id: \.self) { category in
                            Button(category.rawValue) { viewModel.filterCategory = category }
                                .buttonStyle(.bordered)
                        }
                    }
                    .padding(.horizontal)
                }

                // List or Empty State
                if viewModel.items.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "cart")
                            .font(.system(size: 50))
                            .foregroundStyle(.tertiary)

                        Text("Your grocery list is empty")
                            .font(.headline)
                        Text("Add items above to get started")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 40)
                } else {
                    VStack(spacing: 12) {
                        ForEach(viewModel.groupedItems.keys.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { category in
                            VStack(alignment: .leading, spacing: 8) {

                                Text("\(category.icon) \(category.rawValue)")
                                    .font(.headline)
                                    .padding(.horizontal)

                                ForEach(viewModel.groupedItems[category] ?? []) { item in
                                    HStack {
                                        // Mark Purchased
                                        Button {
                                            viewModel.togglePurchased(item)
                                        } label: {
                                            Image(systemName: item.isPurchased ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(item.isPurchased ? .green : .gray)
                                        }

                                        // Item Name
                                        Text(item.name)
                                            .strikethrough(item.isPurchased)
                                            .foregroundColor(item.isPurchased ? .secondary : .primary)

                                        Spacer()

                                        // Edit Button
                                        Button {
                                            startEditing(item)
                                        } label: {
                                            Image(systemName: "pencil")
                                        }

                                        // Delete Button
                                        Button(role: .destructive) {
                                            viewModel.deleteItem(item)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .background(Color(.systemGray6).ignoresSafeArea())
        .sheet(item: $editingItem) { item in
            editItemSheet(item)
        }
    }

    // MARK: - Editing
    private func startEditing(_ item: ShoppingItem) {
        editingItem = item
        editedName = item.name
        editedCategory = item.category
    }

    @ViewBuilder
    private func editItemSheet(_ item: ShoppingItem) -> some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Item")) {
                    TextField("Name", text: $editedName)
                    Picker("Category", selection: $editedCategory) {
                        ForEach(GroceryCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Edit Item")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        var updated = item
                        updated.name = editedName
                        updated.category = editedCategory
                        viewModel.updateItem(updated)
                        editingItem = nil
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { editingItem = nil }
                }
            }
        }
    }
}
