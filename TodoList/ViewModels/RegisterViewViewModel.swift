//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RevisterViewViewModel: ObservableObject {
    @Published var name = "Jesus"
    @Published var email = "djchux@gmail.com"
    @Published var password = "santapola"
    
    init() {}
    
    func register() {
        print("register called")
        guard validate() else {
            print("validation failed")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                print("Auth.auth().createUser guard")
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                print("Someting is empty")
                return false
              }
        
        guard email.contains("@") && email.contains(".") else {
            print("incorrect email")
            return false
        }
        
        guard password.count >= 6 else {
            print("incorrect password")
            return false
        }
        return true
    }
    
}
