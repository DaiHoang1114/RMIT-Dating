/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Authors (ID):
    Nguyen Minh Tri    (s3726096)
    Duong Minh Nhat    (s3715125)
    Hoang Quoc Dai    (s3426353)
    Vu Duy Khoi    (s3694615)
  Created  date: 10/09/2022
  Last modified: 18/09/2022
  Acknowledgement:
    https://firebase.google.com/docs/build
    https://www.appcoda.com/swiftui-camera-photo-library/
    https://youtube.com (tutorial videos)
*/

import Foundation

class UserViewModel: ObservableObject {
    @Published private var user: User = User(uuid: "", email: "")
    @Published private var isLogin: Bool = false
    
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
            if !decodedUser.getUUID().isEmpty {
                self.isLogin = true
            }
        } catch let error {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
    
    func reset() {
        resetUserInUserDefault()
        self.user = User(uuid: "", email: "")
        self.isLogin = false
    }
    
    func getIsLogin() -> Bool {
        return self.isLogin
    }
    
    func setIsLogin(status: Bool) {
        self.isLogin = status
    }
}
