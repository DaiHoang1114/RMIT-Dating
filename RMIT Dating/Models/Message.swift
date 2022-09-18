//
//  Message.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 18/09/2022.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    //if user is the sender = false, user is receiver = true
    var received: Bool
    var timestamp: Date
    
    //user id of usr who sends
    var ownerId: String
}
