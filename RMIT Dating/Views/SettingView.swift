//
//  SettingView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    @State var userInfoDto: UserInfo = UserInfo()
    
    var body: some View {
        VStack {
            Form {
                TextField(text: $userInfoDto.name) {
                    Text("Full Name")
                }
                
                DatePicker(selection: $userInfoDto.dob, in: ...Date(), displayedComponents: .date) {
                    Text("Date of Birth")
                        .foregroundColor(.gray)
                }
                .fixedSize()
                
                TextField(text: $userInfoDto.phone) {
                    Text("Phone")
                }
                
                Section{
                    Button("Next") {
                        userInfoVM.createUserInfo(userId: userVM.getUUID(),userInfoDto: userInfoDto)
                    }
                    Button("Test") {
                        print(userInfoVM.fetchUserInfoByUserId(userId: userVM.getUUID()))
                    }
                }
                
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
