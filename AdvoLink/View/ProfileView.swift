//
//  ContentView.swift
//  test
//
//  Created by Sahana Suresh on 10/26/23.
//  further improvements need to be made: tag section and also recent events/posts?

import SwiftUI

struct ProfileView: View {
    @State private var name = ""
    @State private var socialMedia = ""
    @State private var bio = ""
    @State private var isEditing = false
    var body: some View {
        NavigationView{
            VStack(spacing: 150){
                HStack(spacing: 5){
                    VStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                            .position(x: 80, y: 60)
                        Button(action: {
                        }) {
                            Text("Add Profile Picture")
                                .foregroundColor(.purple)
                                .position(x: 80, y: 80)
                        }
                        
                    }
                    
                    VStack{
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200)
                            .position(x: 75, y: 40)
                        TextField("Social Media", text: $socialMedia)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width:200)
                            .position(x: 75, y: 25)
                    }
                }
                
                TextField("Tell us about yourself!", text: $bio, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineLimit(5)
                    .padding()
                    .frame(maxWidth: 400)
                    .frame(minHeight: 100)
                    .position(x:200,y:-50)
                
                Button(action: {
                    isEditing.toggle()
                })
                {
                    Text(isEditing ? "Save" : "Edit")
                }
                .bold()
                .frame(width:100, height:50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundColor(.white)
                .background(.purple)
                .padding(5)
                .position(x:200, y:-200)
                .navigationTitle("Profile").foregroundColor(.purple)
                .navigationBarItems(
                    trailing:
                        NavigationLink(
                            destination: UserSettings(),
                            label: {
                                Text("Settings").foregroundColor(.purple)
                                Image(systemName:"gear").foregroundColor(.purple)
                            })
                )
            }
        }
    }
}

#Preview {
    ProfileView()
}

