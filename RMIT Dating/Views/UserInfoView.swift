//
//  UserInfoView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 04/09/2022.
//

import Foundation
import SwiftUI

struct UserInfoView: View {
    @ObservedObject var loginVM: LoginViewModel
    var name: String = "name"
    var age: String = "age"
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        CircleImage(image: Image("avatar-sample"), width: 150, height: 150)
                        
                        Text("\(name), \(age)".uppercased())
                            .font(.system(size: 35, weight: .bold))
                        
                        
                        HStack {
                            CircleButton(image: Image(systemName: "gear"), text: "settings")
                            
                            NavigationLink {
                                SettingView()
                            } label: {
                                CircleButton(image: Image(systemName: "pencil"), text: "edit profile")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            
                            CircleButton(image: Image(systemName: "checkerboard.shield"), text: "safety")
                        } // endHStack
                    } // end VStack
                } //end ZStack
                
                Spacer()
                
                Button {
                    //sign out action
                    loginVM.resetEnv()
                } label: {
                    Text("Sign out")
                        .modifier(ButtonModifier())
                        .padding(.bottom, 30)
                }
            } //end VStack
        } //end NavigationView

    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(loginVM: LoginViewModel())
//        UserInfoView(name: "Jisoo", age: "27")
    }
}
