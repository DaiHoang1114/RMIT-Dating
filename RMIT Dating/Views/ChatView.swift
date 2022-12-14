/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Authors (ID):
    Nguyen Minh Tri    (s3726096)
    Duong Minh Nhat    (s3715125)
    Hoang Quoc Dai    (s3426353)
    Vu Duy Khoi    (s3694615)
  Created  date: 10/09/2022
  Last modified: 18/09/2022
  Acknowledgement:
    https://firebase.google.com/docs/build
    https://www.appcoda.com/swiftui-camera-photo-library/
    https://youtube.com (tutorial videos)
*/

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var userInfoVM: UserInfoViewModel
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
        .onAppear {
            messagesVM.getMessages(isAdmin: userInfoVM.getName() == "Admin" ? true : false)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(UserInfoViewModel())
    }
}
