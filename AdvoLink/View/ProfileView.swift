//
//  ContentView.swift
//  test
//
//  Created by Sahana Suresh on 10/26/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var name = ""
    @State private var socialMedia = ""
    @State private var bio = ""
    @State private var isEditing = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                        Button(action: {
                        }) {
                            Text("Add Profile Picture")
                                .foregroundColor(.blue)
                        }
                        
                    }
                    
                    VStack{
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(!isEditing)
                        TextField("Social Media", text: $socialMedia)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(!isEditing)
                    }
                }
                TextEditor(text: $bio)
                    .padding()
                    .border(Color.gray, width: 1)
                    .frame(minHeight: 100)
                    .disabled(!isEditing)
                
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text(isEditing ? "Save" : "Edit")
                        .foregroundColor(.blue)
                }
                .navigationTitle("Profile")
                .navigationBarItems(
                    trailing:
                        NavigationLink(
                            destination: UserSettings(),
                            label: {
                                Image(systemName:"gear")
                            })
                )
            }
        }
    }
}

#Preview {
    ProfileView()
}

