**Grocery List App:**

A simple iOS Grocery List app built with SwiftUI, Realm, and following Clean Architecture principles.
Users can add, edit, delete, mark items as purchased, and filter/group items by category.

**Features:**

1. Add new grocery items (name + category)

2. Edit existing items (name and/or category)

3. Delete items from the list

4. Mark items as purchased or unpurchased

5. Filter the list by category

6. Items visually grouped by category

7. Clean architecture: View → ViewModel → UseCase → Repository → Realm

**Architecture:**

- View: SwiftUI views (GroceryListView)

- ViewModel: ShoppingViewModel holds UI state, filtering, and user actions

- UseCase: ShoppingUseCase contains business logic

- Repository: ShoppingRepository handles CRUD operations with Realm

- Model: ShoppingItem (Entity), GroceryCategory (Enum)

**Requirements:**

- Xcode 15 or later

- iOS 17+

- Swift 5.9+

- RealmSwift

**Running the App:**

- Select a Simulator or a physical device in Xcode.

- Press Cmd + R or click Run.

- The app will launch with an empty grocery list.

**Usage:**

- Add Item: Enter a name and select a category → press “Add Item”.

- Mark Purchased: Tap the circle next to an item to mark/unmark it.

- Edit Item: Tap the pencil icon → edit name or category → Save.

- Delete Item: Tap the trash icon.

- Filter: Use horizontal buttons at the top to filter by category.

- Grouped View: Items are visually grouped by category.

**Testing:**

Unit tests are included for ShoppingViewModel

**Tests cover:**

- Adding, deleting, and updating items

- Toggling purchased

- Filtering by category

- Grouping items by category

**Notes:**

- Install dependencies via Swift Package Manager (RealmSwift is included).

- The app uses Realm for local persistence.

- Clean architecture ensures separation of concerns and testability.

- Fully functional offline.
