//
//  UserInfoView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 04/09/2022.
//

import Foundation
import SwiftUI

struct UserInfoView: View {
    var name: String = "name"
    var age: String = "age"
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        CircleImage(image: Image("avatar-sample"))
                        
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
            } //end VStack
        } //end NavigationView

    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
//        UserInfoView(name: "Jisoo", age: "27")
    }
}
