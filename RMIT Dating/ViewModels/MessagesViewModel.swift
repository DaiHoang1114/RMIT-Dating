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
import Firebase

class MessagesViewModel: ObservableObject {
    let dbName = "Messages"
    
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
    let db = Firestore.firestore()
    
    func getMessages(isAdmin: Bool) {
        db.collection(dbName).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            //only return non-nil values
//            self.messages = documents.compactMap { queryDocumentSnapshot -> Message? in
//                do {
//                    return try queryDocumentSnapshot.data(as: Message.self)
//                } catch {
//                    print("Error decoded document into messages: \(error)")
//                    return nil
//                }
//            }
            
//            self.messages = documents.compactMap { queryDocumentSnapshot -> Message? in
//              return try? queryDocumentSnapshot.data(as: Message.self)
//            }
            
            self.messages = documents.map {
                queryDocumentSnapshot -> Message in

                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String
                let text = data["text"] as? String
                let received = data["received"] as? Bool
                let timestamp = (data["timestamp"] as! Timestamp).dateValue()

                return Message(id: id!, text: text!, received: received!, timestamp: timestamp)
            }
            
            self.messages.sort {$0.timestamp < $1.timestamp}
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
            
            if isAdmin {
                for i in 0..<self.messages.count {
                    self.messages[i].received.toggle()
                }
            }
        }
    } //end func
    
    func sendMessage(text: String, isAdmin: Bool) {
//        do {
//            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
//
//            try db.collection(dbName).document.setData(newMessage)
//        } catch {
//            print("Error adding message to fire store: \(error)")
//        }
        
        let newMessage = Message(id: "\(UUID())", text: text, received: isAdmin ? true : false, timestamp: Date())
        
        
//        var ref: DocumentReference? = nil
        db.collection(dbName).addDocument(data: [
            "id": newMessage.id,
            "text": newMessage.text,
            "received": newMessage.received,
            "timestamp": newMessage.timestamp
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            }
//            else {
//                self.setUserInfo(userInfo: userInfoDto)
//                self.setUserId(userId: userId)
//                self.setUuid(uuid: ref!.documentID)
//                print("Document added: \(self.getUserInfo())")
//            }
        }
        
    }
}
