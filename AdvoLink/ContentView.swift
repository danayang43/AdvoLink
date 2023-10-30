//
//  ContentView.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/24/23.
//
import SwiftUI
struct ContentView: View {
    @AppStorage("current_status") var status = false
    var body: some View {
        NavigationView{
            VStack{
                if status{MainTabView()}
                else{Login()}
            }
        }
    }
}
#Preview {
    ContentView()
}


