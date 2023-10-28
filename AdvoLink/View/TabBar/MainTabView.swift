//
//  MainTabView.swift
//  AdvoLink
//
//  Created by Charlotte Zhou on 10/28/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            Text("Home")
                .tabItem {
                    Image(systemName:"house")
                }
            
            Text("Learn")
                .tabItem {
                    Image(systemName:"book")
                }
            
            CreateView()
                .tabItem {
                    Image(systemName:"plus.square")
                }
            
            Text("Search")
                .tabItem {
                    Image(systemName:"magnifyingglass")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName:"person")
                }
        }
        .accentColor(.purple)
    }
}

#Preview {
    MainTabView()
}

