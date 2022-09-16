//
//  UserInfo.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 16/09/2022.
//

import Foundation

struct UserInfo {
    private var userId: String
    private var name: String
    private var dob: String
    private var phone: String
    private var maritalStatus: String
    private var gender: String
    private var religion: String
    private var hobbies: [String]
    private var musics: [String]
    //images
    
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
    
    mutating func setDob(dob: String) {
        self.dob = dob
    }
    
    func getDob() -> String {
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
    
    init(uuid: String, name: String, dob: String, phone: String, maritalStatus: String,
         gender: String, religion: String, hobbies: [String], musics: [String]) {
        self.uuid = uuid
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
        self.name = ""
        self.dob = ""
        self.phone = ""
        self.maritalStatus = ""
        self.gender = ""
        self.religion = ""
        self.hobbies = []
        self.musics = []
    }
}
