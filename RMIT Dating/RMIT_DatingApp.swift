//
//  RMIT_DatingApp.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import SwiftUI
import Firebase

@main
struct RMIT_DatingApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
