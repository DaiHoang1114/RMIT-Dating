//
//  SignupView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import SwiftUI

struct SignupView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    
    @State var match: Bool = false
    var body: some View {
        if match {
            LoginView()
        } else {
            ZStack {
                VStack {
                    NewUsernameTextField(username: $username)
                    NewPasswordSecureField(password: $password)
                    ReTypePasswordSecureField(repassword: $repassword)
                    SignUpButton(password: $password, repassword: $repassword, match: $match)
                }
            }
        }
    }
}

struct NewUsernameTextField : View {
    @Binding var username: String
    var body: some View {
    return TextField("Username", text: $username)
                .padding()
                .background(ColorConstants.lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
}
    
struct NewPasswordSecureField : View {
    @Binding var password: String
    var body: some View {
    return SecureField("Password", text: $password)
            .padding()
            .background(ColorConstants.lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        }
}

struct ReTypePasswordSecureField : View {
    @Binding var repassword: String
    var body: some View {
    return SecureField("Re-type password", text: $repassword)
            .padding()
            .background(ColorConstants.lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        }
}

struct SignUpButton : View {
    @Binding var password: String
    @Binding var repassword: String
    @Binding var match: Bool
    
    var body: some View {
        return Button(action: {
            if self.password == self.repassword {
                self.match = true
            }
            
        }) {
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
