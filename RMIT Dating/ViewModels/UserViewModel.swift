//
//  UserViewModel.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 15/09/2022.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published private var user: User = User(uuid: "", email: "")
    
    func setEmail(email: String) {
        self.user.setEmail(email: email)
    }
    
    func getEmail() -> String {
        return self.user.getEmail()
    }
    
    func setUUID(uuid: String) {
        self.user.setUUID(uuid: uuid)
    }
    
    func getUUID() -> String {
        return self.user.getUUID()
    }
    
    func getUser() -> User {
        return self.user
    }
    
    func setUser(user: User) {
        self.user = user
    }
}
