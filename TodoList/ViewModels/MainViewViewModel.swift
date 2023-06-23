//
//  MainViewViewModel.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import Foundation
import FirebaseAuth
class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            print("MainViewviewModel init self.handler reached")
            DispatchQueue.main.async {
                print(user?.uid ?? "no user ID")
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
