//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import SwiftUI
import FirebaseCore

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
