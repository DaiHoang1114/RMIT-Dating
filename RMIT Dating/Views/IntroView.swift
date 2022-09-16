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
                LogInViewButton()
                
                // Button Sign Up
                SignUpViewButton()
            }
        }
    }
}

struct SignUpViewButton : View {
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

struct LogInViewButton : View {
    var body: some View {
        return NavigationLink {
            LoginView()
            } label: {
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

struct IntroView_Preview: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
