//
//  ShoppingListAppApp.swift
//  ShoppingListApp
//
//  Created by Rishabh Gupta on 10/02/26.
//

import SwiftUI

@main
struct ShoppingListAppApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = ShoppingRepository()
            let useCase = ShoppingUseCase(repository: repository)
            GroceryListView(viewModel: ShoppingViewModel(useCase: useCase))
        }
    }
}


