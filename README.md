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

**Screenshot of Running App:**
<img width="429" height="867" alt="Screenshot 2026-02-10 at 5 46 33 PM" src="https://github.com/user-attachments/assets/ef167a23-6974-4ba0-af7b-a528d10214a9" />
<img width="424" height="858" alt="Screenshot 2026-02-10 at 5 46 40 PM" src="https://github.com/user-attachments/assets/c51be4bd-e938-4a59-a9fd-82e70256e473" />
<img width="413" height="859" alt="Screenshot 2026-02-10 at 5 46 52 PM" src="https://github.com/user-attachments/assets/f0334505-5e58-4b59-bf66-825a35fdf563" />
<img width="444" height="864" alt="Screenshot 2026-02-10 at 5 47 04 PM" src="https://github.com/user-attachments/assets/f033e66e-0270-4d15-bda6-ee5b095004bd" />
<img width="428" height="862" alt="Screenshot 2026-02-10 at 5 47 13 PM" src="https://github.com/user-attachments/assets/7b7a92bc-f09a-4bf3-b25f-677bafcbc39c" />

