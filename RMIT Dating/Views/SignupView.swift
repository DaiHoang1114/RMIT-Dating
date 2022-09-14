//
//  SignupView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    
    @State var signUpSuccess: Bool = false
    @State var error: String = ""
    
    var body: some View {
        
        if signUpSuccess{
            LoginView()
        } else {
            ZStack {
                VStack {
                    NewEmailTextField(email: $email)
                    NewUsernameTextField(username: $username)
                    NewPasswordSecureField(password: $password)
                    ReTypePasswordSecureField(repassword: $repassword)
                    if !signUpSuccess && !error.isEmpty {
                        Text(error)
                            .foregroundColor(.red)                    }
                    SignUpButton(email: $email, password: $password, repassword: $repassword, signUpSuccess: $signUpSuccess, error: $error)
                }
            }
        }
    }
}

struct NewEmailTextField : View {
    @Binding var email: String
    var body: some View {
    return TextField("Email", text: $email)
            .modifier(TextFieldInputModifier())
        }
}

struct NewUsernameTextField : View {
    @Binding var username: String
    var body: some View {
    return TextField("Username", text: $username)
            .modifier(TextFieldInputModifier())
        }
}
    
struct NewPasswordSecureField : View {
    @Binding var password: String
    var body: some View {
    return SecureField("Password", text: $password)
            .modifier(TextFieldInputModifier())
        }
}

struct ReTypePasswordSecureField : View {
    @Binding var repassword: String
    var body: some View {
    return SecureField("Re-type password", text: $repassword)
            .modifier(TextFieldInputModifier())
        }
}

struct SignUpButton : View {
    @Binding var email: String
    @Binding var password: String
    @Binding var repassword: String
    @Binding var signUpSuccess: Bool
    @Binding var error: String
    
    var body: some View {
        return Button(action: {
            if !self.password.isEmpty && !self.email.isEmpty {
                if self.password == self.repassword {
                    signUp()
                } else {
                    self.error = "Re-type password does not match"
                }
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
    
    func signUp() {
        Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, error in
        print("==============================")
            if let result = authResult {
                print("Result: \(result)")
            }
            if error != nil {
                self.error = error!.localizedDescription
            } else {
                self.signUpSuccess = true
                self.error = ""
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
