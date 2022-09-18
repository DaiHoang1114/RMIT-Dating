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
    
    func saveUserToUserDefault() {
        do {
            let encodedUser = try JSONEncoder().encode(self.user)
            UserDefaults.standard.set(encodedUser, forKey: "user")
        } catch let error {
            fatalError("Failed to encode JSON: \(error)")
        }
    }
    
    func resetUserInUserDefault() {
        do {
            let encodedUser = try JSONEncoder().encode(User(uuid: "", email: ""))
            UserDefaults.standard.set(encodedUser, forKey: "user")
        } catch let error {
            fatalError("Failed to encode JSON: \(error)")
        }
    }

    func loadUserFromUserDefault() {
        guard let decodedUser = UserDefaults.standard.data(forKey: "user") else {return}
        
        do {
            let decodedUser = try JSONDecoder().decode(User.self, from: decodedUser)
            self.user = decodedUser
        } catch let error {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
    
    func reset() {
        resetUserInUserDefault()
        self.user = User(uuid: "", email: "")
    }
}
