//
//  UserInfoView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 04/09/2022.
//

import Foundation
import SwiftUI

struct UserInfoView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CircleImage(image: Image("avatar-sample"))
                    
                    Text("Name, Age")
                    
                    NavigationLink {
                        SettingView()
                        } label: {
                            Text("Edit profile")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.green)
                                .cornerRadius(15.0)
                        }
                }
                
            }
        }

    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
