//
//  NewItemViewViewModel.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else { return }
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        let uid = UUID().uuidString
        let newItem = TodoListItem(
            id: uid,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(uid)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.isEmpty else { return false }
        guard dueDate >= Date().addingTimeInterval(-24*60*60) else { return false }
        
        return true
    }
    
}
