//
//  UploadImage.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/29/23.
//
import SwiftUI
import Firebase
import FirebaseStorage
func UploadImage(imageData: Data, path: String, completion: @escaping(String) -> ()){
    
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    
    storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
        if err != nil{
            completion("")
            return
        }
        
        storage.child(path).child(uid).downloadURL { (url, err)in
            if err != nil{return}
            
            completion("")
            
        }
    }
}

