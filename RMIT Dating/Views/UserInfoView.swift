//
//  UserInfoView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 04/09/2022.
//

import Foundation
import SwiftUI

struct UserInfoView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    
    @ObservedObject var loginVM: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        CircleImage(image: Image("avatar-sample"), width: 150, height: 150)
                        
                        Text("\(userInfoVM.getName().isEmpty ? "NAME" : userInfoVM.getName()), \(userInfoVM.calculateAge())".uppercased())
                            .font(.system(size: 35, weight: .bold))
                        
                        
                        HStack {
                            Button {
                                //sign out action
                                loginVM.resetEnv()
                                userVM.reset()
                            } label: {
                                CircleButton(image: Image(systemName: "escape"), text: "log out")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            CircleButton(image: Image(systemName: "gear"), text: "settings")

                            CircleButton(image: Image(systemName: "checkerboard.shield"), text: "safety")
                        } // endHStack
                    } // end VStack
                } //end ZStack
                
                Spacer()
                
                ScrollView {
                    VStack {
                        HStack {
                            Text("About Me")
                                .fontWeight(.semibold)
                                .font(.system(size: 23))
                            Spacer()
                        }
                        HStack {
                            Text("Gender: \(userInfoVM.getGender().isEmpty ? "Unidentified" : userInfoVM.getGender())")
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        HStack {
                            Text("Religion: \(userInfoVM.getReligion().isEmpty ? "None" : userInfoVM.getReligion())")
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        HStack {
                            Text("Marital: \(userInfoVM.getMaritalStatus().isEmpty ? "Unidentified" : userInfoVM.getMaritalStatus())")
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        
                        HStack {
                            Text("My Interests")
                                .fontWeight(.semibold)
                                .font(.system(size: 23))
                            Spacer()
                        }
                        HStack {
                            ForEach(userInfoVM.getHobbies(), id: \.self) { hobby in
                                    Text(hobby)
                                        .modifier(InterestModifier())
                            }
                            Spacer()
                        }
                        .modifier(InfoTextModifier())
                        
                        HStack {
                            Text("Music Genre")
                                .fontWeight(.semibold)
                                .font(.system(size: 23))
                            Spacer()
                        }
                        HStack {
                            ForEach(userInfoVM.getMusics(), id: \.self) { music in
                                    Text(music)
                                        .modifier(InterestModifier())
                            }
                            Spacer()
                        }
                        
                    } //end VStack
                    .padding(.leading, 20)
                    Spacer()
                } //end ScrollView
                
                Spacer()
                
//                Button {
//                    //sign out action
//                    loginVM.resetEnv()
//                    userVM.reset()
//                } label: {
//                    Text("Sign out")
//                        .modifier(ButtonModifier())
//                        .padding(.bottom, 30)
//                }
            } //end VStack
        } //end NavigationView

    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(loginVM: LoginViewModel())
            .environmentObject(UserInfoViewModel())
//        UserInfoView(name: "Jisoo", age: "27")
    }
}
