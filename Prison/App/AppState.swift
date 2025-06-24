//
//  AppState.swift
//  Prison
//
//  Created by umaxsoft on 19/6/25.
//

import Foundation
import SwiftUI
class AppState: ObservableObject {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    @Published var currentLanguage: String = "en"
}
