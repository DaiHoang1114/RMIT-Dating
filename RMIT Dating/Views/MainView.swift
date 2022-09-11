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
                    Image(systemName: "person.2.fill")
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
