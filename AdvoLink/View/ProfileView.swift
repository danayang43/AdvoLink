//
//  ContentView.swift
//  test
//
//  Created by Sahana Suresh on 10/26/23.
//
import SwiftUI
import SDWebImageSwiftUI
struct ProfileView: View {
    @State private var name = ""
    @State private var socialMedia = ""
    @State private var bio = ""
    @State private var isEditing = false
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @StateObject var settingsData = SettingsViewModel()
    var body: some View {
        NavigationView{
            VStack(spacing: 150){
                if settingsData.userInfo.pic != ""{
                    ZStack{
                        WebImage(url: URL(string: settingsData.userInfo.pic)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 125, height: 125)
                            .clipShape(Circle() )
                        if settingsData.isLoading{
                            ProgressView()
                        }
                    }
                    .padding(.top, 25)
                    .onTapGesture{
                        settingsData.picker.toggle()
                    }
                }
                HStack(spacing: 15)
                {
                    Text(settingsData.userInfo.username)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Button(action: {settingsData.updateDetails(field: "Name")}){
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                HStack(spacing: 15)
                {
                    Text(settingsData.userInfo.bio)
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Button(action: {settingsData.updateDetails(field: "Bio")}){
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                Button(action: settingsData.logOut, label: {
                    Text("Logout")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("Purple"))
                        .clipShape(Capsule())
                })
                .padding()
            }
            .sheet(isPresented: $settingsData.picker) {
                ImagePicker(picker: $settingsData.picker, img_Data: $settingsData.img_data)
            }
            .onChange(of: settingsData.img_data){ (newData) in

            }
        }
    }
}
