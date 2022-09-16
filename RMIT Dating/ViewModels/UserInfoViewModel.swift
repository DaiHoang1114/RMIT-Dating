//
//  UserInfoViewModel.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 16/09/2022.
//

import Foundation

class UserInfoViewModel: ObservableObject {
    @Published private var userInfo: UserInfo = UserInfo()
    
    func setUserId(userId: String) {
        self.userInfo.setUserId(userId: userId)
    }
    
    func getUserId() -> String {
        return self.userInfo.getUserId()
    }
    
    func setName(name: String) {
        self.userInfo.setName(name: name)
    }
    
    func getName() -> String {
        return self.userInfo.getName()
    }
    
    func setDob(dob: String) {
        self.userInfo.setDob(dob: dob)
    }
    
    func getDob() -> String {
        return self.userInfo.getDob()
    }
    
    func setPhone(phone: String) {
        self.userInfo.setPhone(phone: phone)
    }
    
    func getPhone() -> String {
        return self.userInfo.getPhone()
    }
    
    func setMaritalStatus(maritalStatus: String) {
        self.userInfo.setMaritalStatus(maritalStatus: maritalStatus)
    }
    
    func getMaritalStatus() -> String {
        return self.userInfo.getMaritalStatus()
    }
    
    func setGender(gender: String) {
        self.userInfo.setGender(gender: gender)
    }
    
    func getGender() -> String {
        return self.userInfo.getGender()
    }
    
    func setReligion(religion: String) {
        self.userInfo.setReligion(religion: religion)
    }
    
    func getReligion() -> String {
        return self.userInfo.getReligion()
    }
    
    func setHobbies(hobbies: [String]) {
        self.userInfo.setHobbies(hobbies: hobbies)
    }
    
    func getHobbies() -> [String] {
        return self.userInfo.getHobbies()
    }
    
    func setMusics(musics: [String]) {
        self.userInfo.setMusics(musics: musics)
    }
    
    func getMusics() -> [String] {
        return self.userInfo.getMusics()
    }
    
    func setUserInfo(userInfo: UserInfo) {
        self.userInfo = userInfo
    }
    
    func getUserInfo() -> UserInfo {
        return self.userInfo
    }
}
