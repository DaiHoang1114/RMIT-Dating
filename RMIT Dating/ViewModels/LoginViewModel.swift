//
//  LoginViewModel.swift
//  RMIT Dating
//
//  Created by Duong Minh Nhat on 17/09/2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signInSuccess: Bool = false
    @Published var signInProcessing = false
    @Published var signInErrorMessage = ""
    
    func resetEnv(){
        self.email = ""
        self.password = ""
        self.signInSuccess = false
        self.signInProcessing = false
        self.signInErrorMessage = ""
    }
}

