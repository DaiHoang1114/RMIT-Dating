//
//  MessageField.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 18/09/2022.
//

import SwiftUI

struct MessageField: View {
//    var fromUser: String = "IKGYmzZSLrV5OUkqCQOyqe0qGpd2"
//    var toUser: String = "kdwCRyKex3MxbGDYqUrOYKedDvq2"
    
    @EnvironmentObject var conversationsVM: ConversationsViewModel
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
            
            Button {
                conversationsVM.sendMessage(text: message, fromUser: dataFromUser, toUser: dataToUser)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(ColorConstants.tinderPinkDarkColor)
                    .cornerRadius(50)
            }
        } //end HStack
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(ColorConstants.lightGreyColor)
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(ConversationsViewModel())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body : some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
