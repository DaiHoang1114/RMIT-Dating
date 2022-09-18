//
//  IntroView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import Foundation
import SwiftUI

struct IntroView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    
    @State var isLoginView: Bool = false
    @State var isSignUpView: Bool = false
    
    var body: some View {
        if !userVM.getUUID().isEmpty && userVM.getIsLogin() {
            LoginView()
        } else {
            NavigationView {
                ZStack {
                    ColorConstants.tinderPinkLightColor
                    //                    .opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        // Logo
                        Image("logo")
                            .frame(width: 150, height: 150, alignment: .center)
                            .padding(.bottom, 50)
                        
                        // Button Log in
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Log in")
                                .modifier(ButtonModifier())
                        }
                        
                        // Button Sign Up
                        NavigationLink {
                            SignupView()
                        } label: {
                            Text("Sign Up")
                                .modifier(ButtonModifier())
                        }
                    } //end VStack
                } //end ZStack
            } //end NavigationView
            .onAppear {
                userVM.loadUserFromUserDefault()
                if (!userVM.getUUID().isEmpty) {
                    userInfoVM.fetchUserInfoByUserId(userId: userVM.getUUID())
                }
            }
        }
    }
}

struct IntroView_Preview: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
