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
                    Text("Personal Settings").font(.title)
                        .foregroundColor(Color.purple.opacity(0.5))
                        .position(x: 100, y: 0)
                    Spacer()
                }.padding()
                .padding(.top,10)
            }.frame(height: 100)
            VStack(spacing:10){
                btnView(image: "acount", name: "Account")
                btnView(image: "notification", name: "Notifications")
                btnView(image: "privacy", name: "Privacy")
                btnView(image: "helpcenter", name: "Help Center")
                btnView(image: "general", name: "General")
                btnView(image: "about", name: "About Us")
            }.position(x: 150, y: 200)
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
