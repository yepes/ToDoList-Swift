//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for list ofsingle to do list item (each row in itms list
class TodoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
