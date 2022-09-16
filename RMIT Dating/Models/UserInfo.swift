//
//  UserInfo.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 16/09/2022.
//

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
    //images
    
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
