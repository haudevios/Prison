//
//  RootView.swift
//  Prison
//
//  Created by umaxsoft on 19/6/25.
//
import SwiftUI

struct RootView: View {
    @StateObject var appState = AppState()
    var body: some View {
        if appState.hasCompletedOnboarding {
           EmptyView()
        } else {
            OnboardingFlowView()
                .environmentObject(appState)
        }
    }
}
