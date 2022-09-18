//
//  LoginView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import Foundation
import SwiftUI
import Firebase

struct LoginView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    
    @StateObject var loginVM: LoginViewModel = LoginViewModel()
    
    var body: some View {
        if loginVM.signInSuccess || !userVM.getUser().getUUID().isEmpty {
            MainView(loginVM: loginVM)
                .navigationBarBackButtonHidden(true)
        } else {
            VStack {
                WelcomeText()
                AppImage()
                TextField("Email", text: $loginVM.email)
                    .modifier(TextFieldInputModifier())
                
                SecureField("Password", text: $loginVM.password)
                    .modifier(TextFieldInputModifier())
                
                if !loginVM.signInSuccess && !loginVM.signInErrorMessage.isEmpty {
                    Text("Failed signing account: \(loginVM.signInErrorMessage)")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    signIn()
                }) {
                    Text("Log in")
                        .modifier(ButtonModifier())
                }
                .disabled(!loginVM.signInProcessing && !loginVM.email.isEmpty && !loginVM.password.isEmpty ? false : true)
            }//end VStack
        }
    }
    
    func signIn() {
        loginVM.signInProcessing = true

        Auth.auth().signIn(withEmail: loginVM.email, password: loginVM.password)
        {
            authResult, error in

            guard error == nil else {
                loginVM.signInProcessing = false
                loginVM.signInErrorMessage = error!.localizedDescription
                return
            }

            switch authResult {
            case .none:
                loginVM.signInErrorMessage = "Could not sign in user."
                loginVM.signInProcessing = false
                self.loginVM.signInSuccess = false
            case .some(_):
                loginVM.signInErrorMessage = "User signed in"
                loginVM.signInProcessing = false
                self.loginVM.signInSuccess = true
                self.userVM.setUser(user:User(uuid: Auth.auth().currentUser!.uid, email: Auth.auth().currentUser!.email ?? ""))
                userInfoVM.fetchUserInfoByUserId(userId: userVM.getUUID())
                userVM.saveUserToUserDefault()
                userVM.setIsLogin(status: true)
            }
        }
    }
}

struct WelcomeText: View {
    var body: some View {
        return Text("Welcome!")
             .font(.largeTitle)
             .fontWeight(.semibold)
             .padding(.bottom, 20)
    }
}

struct AppImage: View {
    var body: some View {
        return Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .padding(.bottom, 75)
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(UserViewModel())
            .environmentObject(UserInfoViewModel())
    }
}
