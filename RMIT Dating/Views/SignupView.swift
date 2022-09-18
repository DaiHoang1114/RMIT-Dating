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
                            .modifier(ButtonModifier())
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
