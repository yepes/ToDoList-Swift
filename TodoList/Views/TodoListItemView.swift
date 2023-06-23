//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import SwiftUI

struct TodoListItemView: View {
    
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: TodoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
        .padding(.bottom, 8)
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: .init(
            id: "123",
            title: "Sample title",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970, isDone: true
        ))
    }
}
