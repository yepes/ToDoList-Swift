//
//  TodoListViewViewModel.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary tab
class TodoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    /// Deletes a todo item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
