//
//  SignupView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import SwiftUI
import Firebase

struct SignupView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    @State var signUpSuccess: Bool = false
    @State var signUpErrorMessage: String = ""
    @State var signUpProcessing = false
    
    var body: some View {
        
        if signUpSuccess{
            SettingView()
        } else {
            ZStack {
                VStack {
                    TextField("Email", text: $email)
                        .modifier(TextFieldInputModifier())
                    SecureField("Password", text: $password)
                        .modifier(TextFieldInputModifier())
                    SecureField("Re-type password", text: $repassword)
                        .modifier(TextFieldInputModifier())
                    
                    if !signUpSuccess && !signUpErrorMessage.isEmpty {
                        Text("Failed creating account: \(signUpErrorMessage)").foregroundColor(.red)
                    }
                    
                    Button(action: {
                        validate()
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                }//VStack
            }//ZStack
        }
    }
    
    func validate() {
        if !self.password.isEmpty && !self.email.isEmpty {
            if self.password == self.repassword {
                signUp()
            } else {
                self.signUpErrorMessage = "Re-type password does not match"
            }
        }
    }
    
    func signUp() {
        signUpProcessing = true
        
        Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, error in
            guard error == nil else {
                signUpProcessing = false
                signUpErrorMessage = error!.localizedDescription
                return
            }
            
            switch authResult {
            case .none:
                self.signUpErrorMessage = "Could not create account."
                signUpProcessing = false
            case .some(_):
                self.signUpErrorMessage = ""
                signUpProcessing = false
                self.signUpSuccess = true
                self.userVM.setUser(user:
                                        User(uuid: Auth.auth().currentUser!.uid, email: Auth.auth().currentUser!.email ?? ""))
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(UserViewModel())
    }
}
