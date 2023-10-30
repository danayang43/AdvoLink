//
//  AdvoLinkApp.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/24/23.
//
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
@main
struct AdvoLinkApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    Auth.auth().canHandle(url)
                })
        }
    }
}
class Appdelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool{
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}

