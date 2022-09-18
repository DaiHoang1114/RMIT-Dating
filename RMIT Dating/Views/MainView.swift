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

struct MainView: View {
    @ObservedObject var loginVM: LoginViewModel
    
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    @StateObject private var targetVM: TargetViewModel = TargetViewModel()
    
    var body: some View {
        TabView {
            UserInfoView(loginVM: loginVM)
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            SwipeView()
                .tabItem() {
                    Image(systemName: "suit.heart.fill")
                    Text("Swipe")
                }
                .onAppear {
                    targetVM.fetchTargets(userInfo: userInfoVM.getUserInfo())
                }
                .environmentObject(targetVM)
            
            MessageView()
                .tabItem() {
                    Image(systemName: "message")
                    Text("Message")
                }
                .onAppear {
                    targetVM.fetchMatches(userInfo: userInfoVM.getUserInfo())
                }
                .environmentObject(targetVM)
        }
    }
}

struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView(loginVM: LoginViewModel())
            .environmentObject(UserInfoViewModel())
    }
}
