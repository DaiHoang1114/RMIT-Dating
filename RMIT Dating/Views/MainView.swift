

//
//  MainView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 04/09/2022.
//
import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            UserInfoView()
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            SwipeView()
                .tabItem() {
                    Image(systemName: "suit.heart.fill")
                    Text("Swipe")
                }
            MessageView()
                .tabItem() {
                    Image(systemName: "message")
                    Text("Message")
                }
        }
    }
}

struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
