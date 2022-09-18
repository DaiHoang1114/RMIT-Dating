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
