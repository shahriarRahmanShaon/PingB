//
//  PingBApp.swift
//  PingB
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI
import Firebase

@main
struct PingBApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
