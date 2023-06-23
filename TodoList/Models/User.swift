//
//  User.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
