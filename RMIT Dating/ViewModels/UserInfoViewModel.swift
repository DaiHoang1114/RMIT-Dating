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
import SwiftUI
import Firebase
import FirebaseStorage

class UserInfoViewModel: ObservableObject {
    @Published private var userInfo: UserInfo = UserInfo()
    
    let db = Firestore.firestore()

    func uploadImage(image: UIImage, imageName: String) {
        let storageRef = Storage.storage().reference()
        let imageRefString = "UserImages/\(self.getUuid())/\(imageName)"
        let imageRef = storageRef.child(imageRefString)
        let data = image.jpegData(compressionQuality: 1.0)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        if let data = data {
            imageRef.putData(data, metadata: metadata) { metadata, error in
                if let metadata = metadata {
                    print(metadata)
                    self.addImages(image: imageRefString)
                    self.updateUserInfo(userInfoDto: self.userInfo)
                }
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
    func createUserInfo(userId: String, userInfoDto: UserInfo, images: [UIImage]) {
        var ref: DocumentReference? = nil
        ref = db.collection("UserInfos").addDocument(data: [
            "userId": userId,
            "name": userInfoDto.name,
            "dob": userInfoDto.dob,
            "phone": userInfoDto.phone,
            "maritalStatus": userInfoDto.maritalStatus,
            "gender": userInfoDto.gender,
            "religion": userInfoDto.religion,
            "hobbies": userInfoDto.hobbies,
            "musics": userInfoDto.musics,
            "images": userInfoDto.images
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.setUserInfo(userInfo: userInfoDto)
                self.setUserId(userId: userId)
                self.setUuid(uuid: ref!.documentID)
                print("Document added: \(self.getUserInfo())")
                
                for (index, image) in images.enumerated() {
                    // MARK: Need update to work with actual userID
                    self.uploadImage(image: image, imageName: "\(index)")
                }
            }
        }
    }
    
    func updateUserInfo(userInfoDto: UserInfo) {
        db.collection("UserInfos").document(userInfoDto.uuid).updateData([
            "userId": userInfoDto.userId,
            "name": userInfoDto.name,
            "dob": userInfoDto.dob,
            "phone": userInfoDto.phone,
            "maritalStatus": userInfoDto.maritalStatus,
            "gender": userInfoDto.gender,
            "religion": userInfoDto.religion,
            "hobbies": userInfoDto.hobbies,
            "musics": userInfoDto.musics,
            "images": userInfoDto.images
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    func fetchUserInfoByUserId(userId: String) {
        db.collection("UserInfos").whereField("userId", isEqualTo: userId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        self.userInfo.setUserId(userId: document.data()["userId"] as! String)
                        self.userInfo.setName(name: document.data()["name"] as! String)
                        self.userInfo.setDob(dob: (document.data()["dob"] as! Timestamp).dateValue())
                        self.userInfo.setPhone(phone: document.data()["phone"] as! String)
                        self.userInfo.setMaritalStatus(maritalStatus: document.data()["maritalStatus"] as! String)
                        self.userInfo.setGender(gender: document.data()["gender"] as! String)
                        self.userInfo.setReligion(religion: document.data()["religion"] as! String)
                        self.userInfo.setHobbies(hobbies: document.data()["hobbies"] as! [String])
                        self.userInfo.setMusics(musics: document.data()["musics"] as! [String])
                    }
                    print(self.userInfo)
                }
        }
    }
    
    func calculateAge() -> Int {
        let dob = self.getDob()
        let endDate = Date()

        let calendar = Calendar.current
        let calcAge = calendar.dateComponents([.year], from: dob, to: endDate)
        let age = calcAge.year!
        
        return age
    }
    
    private func convertStringToDate(stringDate: String) -> Date {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

        // Convert String to Date
        return dateFormatter.date(from: stringDate)!
    }
    
    func setUuid(uuid: String) {
        self.userInfo.setUuid(uuid: uuid)
    }
    
    func getUuid() -> String {
        return self.userInfo.getUuid()
    }
    
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
    
    func setDob(dob: Date) {
        self.userInfo.setDob(dob: dob)
    }
    
    func getDob() -> Date {
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
    
    func setImages(images: [String]) {
        self.userInfo.setImages(images: images)
    }
    
    func addImages(image: String) {
        self.userInfo.addImage(image: image)
    }
    
    func getImages() -> [String] {
        return self.userInfo.getImages()
    }
}
