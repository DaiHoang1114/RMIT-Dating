//
//  MessagesViewModel.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 18/09/2022.
//

import Foundation
import Firebase
//import FirebaseFirestore
//import FirebaseFirestoreSwift

class MessagesViewModel: ObservableObject {
    @Published private(set) var messages: [Message] = []
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("Messages").addSnapshotListener { (querySnapshot, error) in
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
        }
    }
}
