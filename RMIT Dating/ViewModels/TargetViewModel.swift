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
    
    let db = Firestore.firestore()
    
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
        
        db.collection("UserInfos")
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
                    
                    self.viewingTarget = self.targetInfos[0]
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
    
    func likeTarget(userId: String) {
        //like
        let userIds = [userId, viewingTarget.userId]
        var ref: DocumentReference? = nil
        ref = db.collection("Likes").addDocument(data: [
            "userIds": userIds
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("'Like' relationship is created: \(ref!.documentID)")
            }
            self.getNextTarget()
        }
    }
    
    func dislikeTarget(userId: String) {
        print(viewingTarget)
        //dislike
        db.collection("Likes")
            .whereField("userIds", arrayContains: userId)
            .getDocuments() { (querySnapshot, err) in
                if let snapshot = querySnapshot?.documents {
                    for doc in snapshot {
                        //Do delete
                        let userIds = doc.data()["userIds"] as! [String]
                        if userIds.contains(self.viewingTarget.userId){
                            self.db.collection("Likes").document(doc.documentID).delete()
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
}
