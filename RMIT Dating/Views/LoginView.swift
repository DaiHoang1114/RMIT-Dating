//
//  LoginView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import Foundation
import SwiftUI
let storedUsername = "Admin"
let storedPassword = "1234"

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
        
    @State var editingMode: Bool = false
    @State var showView = false
    
    var body: some View {
        if authenticationDidSucceed {
            MainView()
        } else {
            NavigationView {
                ZStack {
                    VStack {
                        WelcomeText()
                        AppImage()
                        UsernameTextField(username: $username)
                        PasswordSecureField(password: $password)
                        if authenticationDidFail {
                            
                            Text("Information not correct. Try again.")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        }
                        
                        LoginButtonContent(username: $username, password: $password, authenticationDidSucceed: $authenticationDidSucceed, authenticationDidFail: $authenticationDidFail)
                        
                        SignUpButtonContent()
                            
                        }
                        .padding()
                }
            }
                    .offset(y: editingMode ? -150 : 0)
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
        return Image("appImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}
    
struct UsernameTextField : View {
    @Binding var username: String
    
    var body: some View {
    return TextField("Username", text: $username)
                .padding()
                .background(ColorConstants.lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
}
    
struct PasswordSecureField : View {
    @Binding var password: String
    var body: some View {
    return SecureField("Password", text: $password)
            .padding()
            .background(ColorConstants.lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        }
}

struct LoginButtonContent : View {
    @Binding var username: String
    @Binding var password: String
    @Binding var authenticationDidSucceed: Bool
    @Binding var authenticationDidFail: Bool
    
    var body: some View {
        return Button(action: {
            if self.username == storedUsername && self.password == storedPassword {
                self.authenticationDidSucceed = true
                self.authenticationDidFail = false
            } else {
                self.authenticationDidFail = true
            }
        }) {
            Text("Log in")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
        }
    }
}

struct SignUpButtonContent : View {
    var body: some View {
        return NavigationLink {
            SignupView()
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
    }
}


struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
