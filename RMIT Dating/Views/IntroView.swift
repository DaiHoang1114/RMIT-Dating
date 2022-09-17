//
//  IntroView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 03/09/2022.
//

import Foundation
import SwiftUI

struct IntroView: View {
    
    @State var isLoginView: Bool = false
    @State var isSignUpView: Bool = false
    
    var body: some View {
        NavigationView {
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
            }
        }
    }
}

struct IntroView_Preview: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
