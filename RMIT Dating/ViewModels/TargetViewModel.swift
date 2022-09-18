//
//  TargetViewModel.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 17/09/2022.
//

import Foundation
import Firebase

class TargetViewModel: ObservableObject {
    @Published private var targetInfos: [UserInfo] = []
    @Published private var targetIndex = 0
    @Published private var viewingTarget = UserInfo()
    @Published private var outOfTargets = false
    
    private let userInfosCollection = Firestore.firestore().collection("UserInfos")
    private let likeCollection = Firestore.firestore().collection("Likes")
    private let matchCollection = Firestore.firestore().collection("Matches")
    
    func fetchTargets(userInfo: UserInfo){
        var targetGender = ""
        switch userInfo.gender {
        case "Male":
            targetGender = "Female"
        case "Female":
            targetGender = "Male"
        case "Others":
            targetGender = "Others"
        default:
            targetGender = ""
        }
        
        userInfosCollection
            .whereField("gender", isEqualTo: targetGender)
            .whereField("userId", isNotEqualTo: userInfo.userId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        var targetInfoDto = UserInfo()
                        targetInfoDto.setUserId(userId: document.data()["userId"] as! String)
                        targetInfoDto.setName(name: document.data()["name"] as! String)
                        targetInfoDto.setDob(dob: (document.data()["dob"] as! Timestamp).dateValue())
                        targetInfoDto.setPhone(phone: document.data()["phone"] as! String)
                        targetInfoDto.setMaritalStatus(maritalStatus: document.data()["maritalStatus"] as! String)
                        targetInfoDto.setGender(gender: document.data()["gender"] as! String)
                        targetInfoDto.setReligion(religion: document.data()["religion"] as! String)
                        targetInfoDto.setHobbies(hobbies: document.data()["hobbies"] as! [String])
                        targetInfoDto.setMusics(musics: document.data()["musics"] as! [String])
                        self.targetInfos.append(targetInfoDto)
                    }
                    print(self.targetInfos)
                    if !self.targetInfos.isEmpty
                    {
                        self.viewingTarget = self.targetInfos[0]
                    }
                }
        }
    }
    
    func getNextTarget() {
        targetIndex += 1
        if targetIndex == targetInfos.count {
            outOfTargets = true
        }
        if !outOfTargets {
            viewingTarget = targetInfos[targetIndex]
        }
    }
    
    func createLike(userIds: [String]) {
        var ref: DocumentReference? = nil
        ref = self.likeCollection.addDocument(data: [
            "userIds": userIds
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("'Like' relationship is created: \(ref!.documentID)")
            }
        }
    }
    
    func createMatch(userIds: [String], likeDocumentId: String) {
        var ref: DocumentReference? = nil
        ref = self.matchCollection.addDocument(data: [
            "userIds": userIds
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("'Match' relationship is created: \(ref!.documentID)")
                
                //Delete "Like" relationship
                self.likeCollection.document(likeDocumentId).delete()
                { err in
                    if let err = err {
                        print("Error deleting document: \(err)")
                    } else {
                        print("Like between \(userIds[0]) and \(userIds[1]) successfully deleted")
                    }
                }
            }
        }
    }
    
    func likeTarget(userId: String) {
        //like
        var userIds = [userId, viewingTarget.userId]
        userIds = userIds.sorted()
        
        var isLikeExisting = false
        var likeDocumentId = ""
        likeCollection
            .whereField("userIds", isEqualTo: userIds)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        isLikeExisting = true
                        likeDocumentId = document.documentID
                    }
                    
                    if isLikeExisting {
                        var isMatchExisting = false
                        self.matchCollection
                            .whereField("userIds", isEqualTo: userIds)
                            .getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    for _ in querySnapshot!.documents {
                                        isMatchExisting = true
                                    }
                                    if !isMatchExisting {
                                        self.createMatch(userIds: userIds, likeDocumentId: likeDocumentId)
                                    }
                                }
                            }
                    }
                    else {
                        self.createLike(userIds: userIds)
                    }
                    self.getNextTarget()
                }
            }
    }
    
    func dislikeTarget(userId: String) {
        print(viewingTarget)
        //dislike
        likeCollection
            .whereField("userIds", arrayContains: userId)
            .getDocuments() { (querySnapshot, err) in
                if let snapshot = querySnapshot?.documents {
                    for doc in snapshot {
                        //Do delete
                        let userIds = doc.data()["userIds"] as! [String]
                        if userIds.contains(self.viewingTarget.userId){
                            self.likeCollection.document(doc.documentID).delete()
                            { err in
                                if let err = err {
                                    print("Error deleting document: \(err)")
                                } else {
                                    print("Like between \(userId) and \(self.viewingTarget.userId) successfully deleted")
                                }
                                
                            }
                        }
                    }
                }
                self.getNextTarget()
        }
    }
    
    func isOutOfTargets() -> Bool {
        return self.outOfTargets
    }
    
    func getViewingTarget() -> UserInfo {
        return self.viewingTarget
    }
    
    func calculateAge() -> Int {
        let dob = self.viewingTarget.getDob()
        let endDate = Date()

        let calendar = Calendar.current
        let calcAge = calendar.dateComponents([.year], from: dob, to: endDate)
        let age = calcAge.year!
        
        return age
    }
}
