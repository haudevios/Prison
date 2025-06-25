//
//  CallVideoDirectViewModel.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//

import SwiftUI
import Combine

class CallVideoPerCharacterViewModel: ObservableObject {
    @Published var character: Character
    @Published var inCall = false
    @Published var inEnd = false
    
    init(character: Character) {
        self.character = character
    }
    
    func acceptCall() {
        inCall = true
        inEnd = false
    }
    
    func endCall() {
        inCall = false
        inEnd = true
    }
    
    func resetCall() {
        inCall = false
        inEnd = false
    }
}
