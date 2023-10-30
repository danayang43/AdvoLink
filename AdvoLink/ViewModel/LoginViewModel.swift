//
//  LoginPageModel.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/24/23.
//
import SwiftUI
import Firebase
class LoginViewModel: ObservableObject {
    @Published var code = ""
    @Published var number = ""
    
    @Published var errorMsg = ""
    @Published var error = false
    @Published var registerUser = false
    @Published var isLoading = false
    @AppStorage("current_status") var status = false
    
    func verifyUser(){
        isLoading = true
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        let phoneNumber = "+" + code + number
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {
            (ID, err) in
            
            if err != nil{
                self.errorMsg = err!.localizedDescription
                self.error.toggle()
                self.isLoading = false
                return
            }
            
               
            alertView(msg: "Enter Verification Code") { (Code) in
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: ID!, verificationCode: Code)
                Auth.auth().signIn(with: credential) { (res, err) in
                    if err != nil{
                        self.errorMsg = err!.localizedDescription
                        self.error.toggle()
                        return
                    }
                    self.checkUser()
                }
            }
        }
        
    }
    
    
    func checkUser(){
        let ref = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid
        
        ref.collection("Users").whereField("uid", isEqualTo: uid).getDocuments{
            (snap, err) in
            if err != nil{
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            
            if snap!.documents.isEmpty{
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            self.status = true
        }
    }
}

