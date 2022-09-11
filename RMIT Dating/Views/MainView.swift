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
            SwipeView()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Swipe")
                }
            MessageView()
                .tabItem() {
                    Image(systemName: "message")
                    Text("Message")
                }
            UserInfoView()
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            SettingView()
                .tabItem() {
                    Image(systemName: "slider.horizontal.3")
                    Text("Setting")
                }
        }
    }
}

struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
