//
//  LanguageSelectionViewModel.swift
//  Prison
//
//  Created by umaxsoft on 23/6/25.
//

import Foundation
import Combine

class LanguageSelectionViewModel: ObservableObject {
    @Published var selectedLanguage: String = ""

    let languages: [(name: String, code: String)] = [
        ("English", "en"),
        ("Vietnamese", "vi"),
        ("Japanese", "ja")
    ]

    func selectLanguage(_ code: String) {
        selectedLanguage = code
    }
}
