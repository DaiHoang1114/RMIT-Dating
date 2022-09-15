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
    
    @State var email: String = ""
    @State var password: String = ""
    @State var signInSuccess: Bool = false
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    
    var body: some View {
        if signInSuccess {
            MainView()
        } else {
            VStack {
                WelcomeText()
                
                TextField("Email", text: $email)
                            .padding()
                            .background(ColorConstants.lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                        .padding()
                        .background(ColorConstants.lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                
                if !signInSuccess && !signInErrorMessage.isEmpty {
                    Text("Failed signing account: \(signInErrorMessage)")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    signIn()
                }) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
                .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
            }//VStack
        }
    }
    
    func signIn() {
        signInProcessing = true

        Auth.auth().signIn(withEmail: email, password: password)
        {
            authResult, error in

            guard error == nil else {
                signInProcessing = false
                signInErrorMessage = error!.localizedDescription
                return
            }

            switch authResult {
            case .none:
                signInErrorMessage = "Could not sign in user."
                signInProcessing = false
                self.signInSuccess = false
            case .some(_):
                signInErrorMessage = "User signed in"
                signInProcessing = false
                self.signInSuccess = true
                self.userVM.setUser(user:User(uuid: Auth.auth().currentUser!.uid, email: Auth.auth().currentUser!.email ?? ""))
                print(userVM.getUser())
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
        return Image("AppImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
