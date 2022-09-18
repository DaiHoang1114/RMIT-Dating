//
//  ChatView.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 18/09/2022.
//

import SwiftUI

struct ChatView: View {
    @StateObject var messagesVM = MessagesViewModel()
    
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
                        ForEach(messagesVM.messages, id:\.id) { message in
                            MessageBubble(message: message)
                        }
                    } //end ScrollView
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messagesVM.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                } //end ScrollViewReader
            } //end VStack
            .background(ColorConstants.tinderPinkLightColor)
            
            MessageField()
                .environmentObject(messagesVM)
        } //end VStack
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
