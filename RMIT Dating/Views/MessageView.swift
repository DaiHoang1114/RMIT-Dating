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

struct MessageView: View {
    
    @EnvironmentObject var targetVM: TargetViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("New Matches")
                        .foregroundColor(Color.red)
                    Spacer()
                }.padding(.leading, 20)

                Divider()
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(targetVM.getMatchInfos(), id:\.userId) { matchInfo in
                            CardImage(image: Image("avatar-sample"), label: matchInfo.getName())
                        }
                    }.padding()
                }
                Divider()
                
                HStack {
                    Text("Messages")
                        .foregroundColor(Color.red)
                    Spacer()
                }.padding(.leading, 20)
                // Message List
                MessageList()
                
            }
        } //end VStack
        .navigationBarTitle("")
        .navigationBarHidden(true)
    } //end navigation view
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .environmentObject(TargetViewModel())
    }
}
