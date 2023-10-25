//
//  LoginPageModel.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/24/23.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    @Published var registerUser: Bool = false
    
    func Login(){
        
    }
    func Register(){
        
    }
    func ForgotPassword(){
        
    }
}
