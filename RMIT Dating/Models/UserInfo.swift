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

struct UserInfo {
    var uuid: String
    var userId: String
    var name: String
    var dob: Date
    var phone: String
    var maritalStatus: String
    var gender: String
    var religion: String
    var hobbies: [String]
    var musics: [String]
    var images: [String] = []
    
    mutating func setUuid(uuid: String) {
        self.uuid = uuid
    }
    
    func getUuid() -> String {
        return self.uuid
    }
    
    mutating func setUserId(userId: String) {
        self.userId = userId
    }
    
    func getUserId() -> String {
        return self.userId
    }
    
    mutating func setName(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    mutating func setDob(dob: Date) {
        self.dob = dob
    }
    
    func getDob() -> Date {
        return self.dob
    }
    
    mutating func setPhone(phone: String) {
        self.phone = phone
    }
    
    func getPhone() -> String {
        return self.phone
    }
    
    mutating func setMaritalStatus(maritalStatus: String) {
        self.maritalStatus = maritalStatus
    }
    
    func getMaritalStatus() -> String {
        return self.maritalStatus
    }
    
    mutating func setGender(gender: String) {
        self.gender = gender
    }
    
    func getGender() -> String {
        return self.gender
    }
    
    mutating func setReligion(religion: String) {
        self.religion = religion
    }
    
    func getReligion() -> String {
        return self.religion
    }
    
    mutating func setHobbies(hobbies: [String]) {
        self.hobbies = hobbies
    }
    
    func getHobbies() -> [String] {
        return self.hobbies
    }
    
    mutating func setMusics(musics: [String]) {
        self.musics = musics
    }
    
    func getMusics() -> [String] {
        return self.musics
    }
    
    mutating func setImages(images: [String]) {
        self.images = images
    }
    
    mutating func addImage(image: String) {
        self.images.append(image)
    }
    
    func getImages() -> [String] {
        return self.images
    }
    
    init(uuid: String, userId: String, name: String, dob: Date, phone: String, maritalStatus: String,
         gender: String, religion: String, hobbies: [String], musics: [String]) {
        self.uuid = uuid
        self.userId = userId
        self.name = name
        self.dob = dob
        self.phone = phone
        self.maritalStatus = maritalStatus
        self.gender = gender
        self.religion = religion
        self.hobbies = hobbies
        self.musics = musics
    }
    
    init() {
        self.uuid = ""
        self.userId = ""
        self.name = ""
        self.dob = Date()
        self.phone = ""
        self.maritalStatus = ""
        self.gender = ""
        self.religion = ""
        self.hobbies = []
        self.musics = []
    }
}
