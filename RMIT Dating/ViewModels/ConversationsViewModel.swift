//
//  ConversationsViewModel.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 18/09/2022.
//

import Foundation
import Firebase


class ConversationsViewModel: ObservableObject {
    let dbName = "Conversations"
    let db = Firestore.firestore()
    
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
//    func loadUserMessages(fromUser: String, toUser: String) {
//        let builtId = buildConversationId(fromUser: fromUser, toUser: toUser)
//
//        if !checkConversationExist(conversationId: builtId) {
//            createConversation(conversationId: builtId)
//            self.messages = []
//            self.lastMessageId = ""
//        } else {
//            db.collection(dbName).whereField("id", isEqualTo: builtId)
//                .getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else {
//                        for document in querySnapshot!.documents {
//                            self.messages = document.data()["messages"] as! [Message]
//                            self.messages.sort {$0.timestamp < $1.timestamp}
//
//                            if let id = self.messages.last?.id {
//                                self.lastMessageId = id
//                            }
//                        }
//                    }
//            }
//        }
//    }
    
    func loadUserMessages(fromUser: String, toUser: String) {
        let builtId = buildConversationId(fromUser: fromUser, toUser: toUser)
        
        db.collection(dbName)
            .whereField("id", isEqualTo: builtId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err
                {
                    print("Error getting documents: \(err)")
                }
                else
                {
                    var isCreated = false
                    for _ in querySnapshot!.documents {
                        isCreated = true
                    }
                    
                    if !isCreated {
                        self.createConversation(conversationId: builtId)
                    } else
                    {
                        self.db.collection(self.dbName).whereField("id", isEqualTo: builtId)
                            .getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    for document in querySnapshot!.documents {
                                        self.messages = document.data()["messages"] as! [Message]
                                        self.messages.sort {$0.timestamp < $1.timestamp}

                                        if let id = self.messages.last?.id {
                                            self.lastMessageId = id
                                        }
                                    }
                                }
                        }
                    }
                }
            }
    }
    
    func checkAndCreateConversation(fromUser: String, toUser: String) {
//        let builtId = buildConversationId(fromUser: fromUser, toUser: toUser)
//
//        if !checkConversationExist(conversationId: builtId) {
//            createConversation(conversationId: builtId)
//        }
        
        
    }
    
    func createConversation(conversationId: String) {
        let messages: [Message] = []

        
        var ref: DocumentReference? = nil
        ref = db.collection(dbName).addDocument(data: [
            "id": conversationId,
            "messages": messages
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added: \(conversationId)")
            }
        }
    }
    
    func checkConversationExist(conversationId: String) -> Bool{
        var isConversationExisted = false
        
        db.collection(dbName)
            .whereField("id", isEqualTo: conversationId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for _ in querySnapshot!.documents {
                        isConversationExisted = true
                    }
                }
            }
        
        return isConversationExisted
    }
    
    func buildConversationId(fromUser: String, toUser: String) -> String {
        var idArray = [fromUser, toUser]
        idArray.sort()
        return idArray[0] + idArray[1]
    }
    
    func sendMessage(text: String, fromUser: String, toUser: String) {
        var searchDocumentId = ""
        
        let builtId = buildConversationId(fromUser: fromUser, toUser: toUser)
        
        let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date(), ownerId: fromUser)
        let newMap = Map(newMessae)
        self.messages.append({newMessage})
        
        print("New message received: \(newMessage)")
        
        print("New message received: \(self.messages)")
        
        db.collection(dbName).whereField("id", isEqualTo: builtId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        searchDocumentId = document.documentID
                        print("Loop document id: \(searchDocumentId)")
                    }
                    
                    if !searchDocumentId.isEmpty {
                        print("pushing  message")
                        self.db.collection(self.dbName).document(searchDocumentId).updateData([
                            "id": builtId,
                            "messages": self.messages
                        ]) { err in
                            if let err = err {
                                print("Error updating document: \(err)")
                            } else {
                                print("Document successfully updated")
                            }
                        }
                    }
                }
        }
        
    }
    
    ////TODO
//    func recalculateReceivedStatus
}
