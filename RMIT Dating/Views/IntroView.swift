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
