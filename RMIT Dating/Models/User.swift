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

struct User: Codable {
    private var uuid: String
    private var email: String
    
    mutating func setUUID(uuid: String) {
        self.uuid = uuid
    }
    
    mutating func setEmail(email: String) {
        self.email = email
    }
    
    func getUUID() -> String {
        return self.uuid
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    init(uuid: String, email: String) {
        self.uuid = uuid
        self.email = email
    }
}
