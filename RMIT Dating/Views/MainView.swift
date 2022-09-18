

//
//  MainView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 04/09/2022.
//
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
