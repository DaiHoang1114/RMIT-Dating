//
//  User.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 15/09/2022.
//

import Foundation

struct User {
    private var uuid: String
    private var email: String
    
    mutating func setUUID(uuid: String) {
        self.uuid = uuid
    }
    
    mutating func setEmail(email: String) {
        self.email = email
    }
    
    func getUUID() -> String {
        return self.uuid
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    init(uuid: String, email: String) {
        self.uuid = uuid
        self.email = email
    }
}
