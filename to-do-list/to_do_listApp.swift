//
//  to_do_listApp.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 16/01/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication,
									 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()

		return true
	}
}

@main
struct to_do_listApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
