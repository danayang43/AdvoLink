//
//  LoginPage.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/24/23.
//

import SwiftUI
import Firebase

struct LoginPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        VStack(spacing: 20){
            Text("Welcome")
                .font(.custom(customFont, size: 55).bold())
                .foregroundColor(.white)
                .frame(height: getRect().height / 10)
            
            Text("Create an account")
                .foregroundColor(.white)
                .font(.custom(customFont, size: 30).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextField("Email", text: $email)
                .foregroundColor(.white)
                .textFieldStyle(.plain)
                .placeholder(when: email.isEmpty){
                    Text("Email")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
            
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundColor(.white)
            
            SecureField("Password", text: $password)
                .foregroundColor(.white)
                .textFieldStyle(.plain)
                .placeholder(when: password.isEmpty){
                    Text("Password")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
            
            Button{
                register()
            } label:{
                Text("Register")
                    .foregroundColor(.black)
                    .bold()
                    .frame(width: 200, height:40)
                
            }
            
            .background(
                Color.white
                    .clipShape(CustomCorners(corners:[.topLeft,.topRight, .bottomLeft, .bottomRight], radius: 25))
                    .ignoresSafeArea()
            )
            .padding(.top)
            .offset(y: 100)
            
            Button{
                login()
            } label:{
                Text("Already have an account? Login")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height:40)
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        
        .onAppear{
            Auth.auth().addStateDidChangeListener{ auth, user in
                if user != nil {
                    userIsLoggedIn.toggle()
                }
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    LoginPage()
}
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
