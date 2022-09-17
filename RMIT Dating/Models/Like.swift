//
//  File.swift
//  RMIT Dating
//
//  Created by Tri Nguyen on 17/09/2022.
//

import Foundation

struct Like {
    private var userIds: [String]
    
    mutating func setUserIds(userIds: [String]) {
        self.userIds = userIds
    }
    
    func getUserIds() -> [String] {
        return self.userIds
    }
    
    init(userIds: [String]) {
        self.userIds = userIds
    }
}
