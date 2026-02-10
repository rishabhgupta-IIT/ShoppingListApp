//
//  ShoppingListAppApp.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//

import SwiftUI

@main
struct ShoppingListAppApp: App {
    let viewModel: ShoppingViewModel

    init() {
        let repository = ShoppingRepository()
        let useCase = ShoppingUseCase(repository: repository)
        self.viewModel = ShoppingViewModel(useCase: useCase)
    }

    var body: some Scene {
        WindowGroup {
            GroceryListView(viewModel: viewModel)
        }
    }
}

