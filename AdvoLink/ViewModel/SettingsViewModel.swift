//
//  SettingsViewModel.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/29/23.
//
import SwiftUI
import Firebase
class SettingsViewModel: ObservableObject {
    @Published var userInfo = UserModel(username: "", pic: "", bio: "")
    @AppStorage("current_status") var status = false
    @Published var picker = false
    @Published var img_data = Data(count: 0)
                            
    let ref = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    @Published var isLoading = false
    
    init(){
        fetchUser()
    }
    func fetchUser()
    {
        ref.collection("Users").document(uid).getDocument{ (doc, err) in
            guard let user = doc else{return}
            let username = user.data()?["username"] as! String
            let pic = user.data()?["imageurl"] as! String
            let bio = user.data()?["bio"] as! String
            DispatchQueue.main.async {
                self.userInfo = UserModel(username: username, pic: pic, bio: bio)
            }
        }
    }
    func logOut()
    {
        try! Auth.auth().signOut()
        status = false
    }
    
    func updateImage(){
        isLoading = true
        UploadImage(imageData: img_data, path: "Profile_Photos") { (url) in
            self.ref.collection("Users").document(self.uid).updateData([
                "imageurl" : url
            ]) { (err) in
                if(err != nil) {return}
                
                self.isLoading = false
                self.fetchUser()
            }
        }
    }
    
    func updateDetails(field : String){
        alertView(msg: "Update \(field)") {txt in
            if txt != "" {
                self.updateBio(id: field == "Name" ? "username" : "bio", value: txt)
            }
        }
    }
    func updateBio(id : String, value: String){
        ref.collection("Users").document(uid).updateData([
            id: value,
        ]) { (err) in
            if err != nil {return}
            self.fetchUser()
        }
    }
}
