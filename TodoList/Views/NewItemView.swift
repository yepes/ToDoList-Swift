//
//  NewItemView.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            
            Text("New Item")
                .font(.system(size: 24))
                .bold()
                .padding(.top)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please fill in the title. Due date should be greater than today")
                    )
                }
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                
                Text(viewModel.canSave ? "correcto" : "incorrecto")
                TLButton(
                    title: "Save",
                    color: .pink
                ) {
                    if (viewModel.canSave) {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(
            get: { true },
            set: { _ in }
        ))
    }
}
