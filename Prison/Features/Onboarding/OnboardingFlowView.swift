//
//  OnboardingFlowView.swift
//  Prison
//
//  Created by umaxsoft on 19/6/25.
//

import SwiftUI

enum OnboardingStep {
    case languageSelection
    case introSlides
    case characterSelection
    case done
}

struct OnboardingFlowView: View {
    @EnvironmentObject var appState: AppState
    @State private var currentStep: OnboardingStep = .languageSelection
    
    var body: some View {
            Group {
                switch currentStep {
                case .languageSelection:
                    LanguageSelectionView(onNext: {
                        currentStep = .introSlides
                    })
                case .introSlides:
                    IntroScreensView()
                case .characterSelection:
                    EmptyView()
                case .done:
                    EmptyView()
                }
            }
    }
    
}
