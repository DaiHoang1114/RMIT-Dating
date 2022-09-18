//
//  MessageList.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 12/09/2022.
//

import SwiftUI

struct MessageList: View {
    
    @EnvironmentObject var targetVM: TargetViewModel
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    
    var body: some View {
        VStack {
            Divider()
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    NavigationLink {
                        ChatView()
                    } label: {
                        MessageCard(image: Image(systemName: "person.circle.fill"), name: "Chat View", message: "Click here to chat")
                            .frame(width: 400, height: 100)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    ForEach(targetVM.getMatchInfos(), id:\.userId) { matchInfo in
                        MessageCard(image: Image("avatar-sample"), name: matchInfo.getName(), message: "i love you <3")
                            .frame(width: 400, height: 100)
                    }
                }
            } //end ScrollView
//                Divider()
        } //end VStack
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
