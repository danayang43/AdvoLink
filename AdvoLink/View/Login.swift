//
//  Login.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/29/23.
//
import SwiftUI
struct Login: View {
    @StateObject var loginData = LoginViewModel()
    var body: some View {
        VStack{
            HStack{
                Text("Login")
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 15){
                TextField("1", text: $loginData.code)
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(width: 45)
                    .background(Color.white)
                    .cornerRadius(15)
                
                TextField("6505551234", text: $loginData.number)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white)
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top, 10)
            
            Image("advolinkslogan")
                .resizable()
                .frame(width:450,height:450)
            if loginData.isLoading{
                ProgressView()
                    .padding()
            }
            else{
                Button(action: loginData.verifyUser, label: {
                    Text("Verify")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("Purple2"))
                        .clipShape(Capsule())
                })
                .disabled(loginData.code == "" || loginData.number == "" ? true : false)
                .opacity(loginData.code == "" || loginData.number == "" ? 0.5 : 1)
            }
            Spacer(minLength: 0)
        }
        .background(Color("Purple").ignoresSafeArea(.all, edges: .all))
        
        .alert(isPresented: $loginData.error, content:{
            Alert(title: Text("Error"), message: Text(loginData.errorMsg), dismissButton: .destructive(Text("Ok")))
        })
        .fullScreenCover(isPresented: $loginData.registerUser, content: {
            Register()
        })
    }
}
#Preview {
    Login()
}

