//
//  TodoListItemsView.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    @StateObject var viewModel:TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: TodoListViewViewModel(
                userId: userId
            )
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete").foregroundColor(.red)
                            } .tint(.red)
                        }
                }
            }
            .navigationTitle("TodoList")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "JcSCj25qe9ZTmSTn5Si0ox1Sjcr1")
    }
}
