//
//  SettingView.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 11/09/2022.
//

import SwiftUI

struct SettingView: View {
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    @State var username: String = ""
    @State var birthday = Date()
    @State var email: String = ""
    @State var phone: String = ""
    
    var body: some View {
        VStack {
            Form {
                TextField(text: $username) {
                    Text("Username")
                }
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                    Text("Birthday")
                        .foregroundColor(.gray)
                }
                .fixedSize()
                TextField(text: $email) {
                    Text("Email")
                }
                TextField(text: $phone) {
                    Text("Phone")
                }
                Section{
                    Button("Next") {
                        
                    }
                    .frame(width: .infinity, alignment: .center)
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
