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
    
    @State var username: String = ""
    @State var birthday = Date()
    @State var email: String = ""
    @State var phone: String = ""
    
    @State var maritalStatus: String = ""
    @State var gender: String = ""
    @State var religion: String = ""
    
    @State var hobbies: [String] = []
    @State var music: [String]  = []
    
    @State var page: Int = 1
    
    var body: some View {
        VStack {
            switch page {
            case 1:
                FirstPage(userInfoDto: $userInfoDto, username: $username, birthday: $birthday, email: $email, phone: $phone)
            case 2:
                SecondPage(maritalStatus: $maritalStatus, gender: $gender, religion: $gender)
            case 3:
                ThirdPage(hobbies: $hobbies, music: $music)
            case 4:
                ImagePage()
            default:
                FirstPage(userInfoDto: $userInfoDto, username: $username, birthday: $birthday, email: $email, phone: $phone)
            }
            Button("Next") {
                page += 1
            }
            Button("Create") {
                userInfoVM.createUserInfo(userId: userVM.getUUID(),userInfoDto: userInfoDto)
            }
            Button("Test") {
                print(userInfoVM.fetchUserInfoByUserId(userId: userVM.getUUID()))
            }
        }
    }
}

struct FirstPage: View {
    @Binding var userInfoDto: UserInfo
    @Binding var username: String
    @Binding var birthday: Date
    @Binding var email: String
    @Binding var phone: String
    
    var body: some View {
        Form {
            TextField(text: $userInfoDto.name) {
                Text("Full Name")
            }
            DatePicker(selection: $userInfoDto.dob, in: ...Date(), displayedComponents: .date) {
                Text("Date of Birth")
                    .foregroundColor(.gray)
            }
            .fixedSize()
            TextField(text: $email) {
                Text("Email")
            }
            TextField(text: $userInfoDto.phone) {
                Text("Phone")
            }
        }
    }
}

struct SecondPage: View {
    @Binding var maritalStatus: String
    @Binding var gender: String
    @Binding var religion: String
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $maritalStatus) {
                    Text("Single").tag("Single")
                    Text("Married").tag("Married")
                } label: {
                    Text("Marital Status:")
                }
                
                Picker(selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Others").tag("Others")

                } label: {
                    Text("Gender")
                }
                
                Picker(selection: $gender) {
                    Text("Buddha").tag("Buddha")
                    Text("Christian").tag("Christian")
                    Text("Muslim").tag("Muslim")
                    Text("None").tag("None")
                    Text("Others").tag("Others")

                } label: {
                    Text("Religion")
                }
            }
        }
    }
}

struct ThirdPage: View {
    @Binding var hobbies: [String]
    @Binding var music: [String]
    
    let hobbiesList = ["Sport", "Esport"]
    let musicList = ["Pop", "Rock", "Classic"]

    
    var body: some View {
        Form {
            Section {
                Text("Hobbies")
                ForEach(hobbiesList, id: \.self) { item in
                    SelectionRow (title: item, selected: hobbies.contains(item)) {
                        if hobbies.contains(item) {
                            hobbies.removeAll { selectedItem in
                                selectedItem == item
                            }
                        } else {
                            hobbies.append(item)
                        }
                    }
                }
            }
            
            Section {
                Text("Music")
                ForEach(musicList, id: \.self) { item in
                    SelectionRow (title: item, selected: hobbies.contains(item)) {
                        if hobbies.contains(item) {
                            hobbies.removeAll { selectedItem in
                                selectedItem == item
                            }
                        } else {
                            hobbies.append(item)
                        }
                    }
                }
            }
        }
    }
}

struct ImagePage: View {
    
    var body: some View {
        Text("")
    }
}
    
struct SelectionRow: View {
    var title: String
    var selected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(title)
                    .foregroundColor(.black)
                if selected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        })
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
