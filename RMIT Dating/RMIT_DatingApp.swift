//
//  RMIT_DatingApp.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import SwiftUI
import Firebase
import Foundation

@main
struct RMIT_DatingApp: App {
    
    @StateObject private var userVM = UserViewModel()
    @StateObject private var userInfoVM = UserInfoViewModel()
    
    init() {
        FirebaseApp.configure()
        
        UITabBar.appearance().backgroundColor = UIColor(ColorConstants.lightBlueGreyColor)
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(userVM)
                .environmentObject(userInfoVM)
        }
    }
}
