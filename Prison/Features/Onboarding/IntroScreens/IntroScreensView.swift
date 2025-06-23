//
//  IntroScreensView.swift
//  Prison
//
//  Created by umaxsoft on 20/6/25.
//

import SwiftUI

public struct IntroScreensView: View {
    @EnvironmentObject var appState: AppState
    public var body: some View {
        Text("Language: \(appState.currentLanguage)")

    }
}
