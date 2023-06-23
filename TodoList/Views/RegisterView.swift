//
//  RegisterView.swift
//  TodoList
//
//  Created by Jesus Yepes on 20/6/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RevisterViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Regístrate",
                       subtitle: "Start organazing todos",
                       angle: -15,
                       background: .orange)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                     .autocapitalization(.none)
                     .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account!", color: .green) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
