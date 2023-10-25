//
//  AdvoLinkApp.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/24/23.
//

import SwiftUI
import Firebase

@main
struct AdvoLinkApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
