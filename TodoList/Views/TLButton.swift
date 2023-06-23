//
//  TLButton.swift
//  TodoList
//
//  Created by Jesus Yepes on 21/6/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Button title", color: .pink){print("clicked")}
    }
}
