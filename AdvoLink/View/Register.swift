//
//  Register.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/29/23.
//
import SwiftUI
struct Register: View {
    @StateObject var registerData = RegisterViewModel()
    var body: some View {
        VStack{
            HStack{
                Text("Register")
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            ZStack{
                if(registerData.image_Data.count == 0)
                {
                    Image(systemName: "person")
                        .font(.system(size:85))
                        .foregroundColor(.black)
                        .frame(width: 115, height: 115)
                        .clipShape(Circle())
                }
                else
                {
                    Image(uiImage: UIImage(data: registerData.image_Data)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 115, height: 115)
                        .clipShape(Circle())
                }
            }
            
            .padding(.top)
            .onTapGesture(perform: {
                registerData.picker.toggle()
            })
            
            HStack(spacing: 15){
                TextField("Name", text: $registerData.name)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white)
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top, 10)
            
            HStack(spacing: 15){
                TextField("Bio", text: $registerData.bio)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white)
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top, 10)
            
            if registerData.isLoading{
                ProgressView()
                    .padding()
            }
            else{
                Button(action: registerData.register, label: {
                    Text("Register")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("Purple"))
                        .clipShape(Capsule())
                })
                .disabled(registerData.image_Data.count == 0 || registerData.name == "" || registerData.bio == "" ? true : false)
                .opacity(registerData.image_Data.count == 0 || registerData.name == "" || registerData.bio == "" ? 0.5 : 1)
            }
            Spacer(minLength: 0)
        }
        .background(Color("Purple").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $registerData.picker, content:{
            ImagePicker(picker: $registerData.picker, img_Data: $registerData.image_Data)
        })
    }
}
