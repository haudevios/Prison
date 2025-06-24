//
//  PrisonApp.swift
//  Prison
//
//  Created by umaxsoft on 18/6/25.
//

import SwiftUI
import Firebase
@main
struct PrisonApp: App {
    init() {
       // FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
