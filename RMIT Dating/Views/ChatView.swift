//
//  ChatView.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 18/09/2022.
//

import SwiftUI

struct ChatView: View {
//    var fromUser: String = "IKGYmzZSLrV5OUkqCQOyqe0qGpd2"
//    var toUser: String = "kdwCRyKex3MxbGDYqUrOYKedDvq2"
    
    @StateObject var conversationsVM = ConversationsViewModel()
    
//    var messageArray = ["Hi babe", "You are really cute", "It would be perfect if we can go out and chat"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in 
                    ScrollView {
    //                    ForEach(messageArray, id:\.self) { text in
    //                        MessageBubble(message: Message(id: "123", text: text, received: true, timestamp: Date()))
    //                    }
                        ForEach(conversationsVM.messages, id:\.id) { message in
                            MessageBubble(message: message)
                        }
                    } //end ScrollView
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: conversationsVM.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                } //end ScrollViewReader
            } //end VStack
            .background(ColorConstants.tinderPinkLightColor)
            
            MessageField()
                .environmentObject(conversationsVM)
        } //end VStack
        .onAppear {
            conversationsVM.loadUserMessages(fromUser: dataFromUser, toUser: dataToUser)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
