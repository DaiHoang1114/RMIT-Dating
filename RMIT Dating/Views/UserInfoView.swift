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
                    UserImage()
                    UserInfo()
                    EditProfile()
                }
                
            }
        }

    }
}

struct UserImage: View {
    var body: some View {
        return Image("user")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct UserInfo: View {
    var body: some View {
        return Text("Name, Age")
    }
}

struct EditProfile: View {
    var body: some View {
        return NavigationLink {
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

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
