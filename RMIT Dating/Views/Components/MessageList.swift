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
