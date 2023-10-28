//
//  UserSettings.swift
//  AdvoLink
//
//  Created by Jerry Wang on 10/27/23.
//  pls dont flame, no images yet, imma make lol

import SwiftUI

struct UserSettings : View {
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Image("BG").resizable().frame(width: 250, height: 15)
                    Spacer()
                }
                HStack{
                    VStack(alignment: .leading, spacing: 45, content: {
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.left").font(.title)
                        }
                        Text("Personal Settings").font(.title)
                    }).foregroundColor(Color.purple.opacity(0.5))
                    Spacer()
                }.padding()
                .padding(.top,10)
                VStack{
                    Image("name").overlay(Text("K").foregroundColor(.white).font(.title))
                    Spacer()
                }.padding(.top,30)
            }.frame(height: 175)
            VStack(spacing:15){
                btnView(image: "acount", name: "Account")
                btnView(image: "notification", name: "Notifications")
                btnView(image: "privacy", name: "Privacy")
                btnView(image: "helpcenter", name: "Help Center")
                btnView(image: "general", name: "General")
                btnView(image: "about", name: "About Us")
            }
            Spacer()
        }
    }
}

struct btnView : View {
    var image = ""
    var name = ""
    var body : some View {
        Button(action: {
        }) {
            HStack(spacing: 15){
                Image(image).renderingMode(.original).resizable().frame(width: 40, height: 40)
                Text(name)
                Spacer(minLength: 15)
                Image(systemName: "chevron.right")
            }.padding()
                .foregroundColor(Color.black.opacity(0.5))
        }
    }
}

#Preview {
    UserSettings()
}
