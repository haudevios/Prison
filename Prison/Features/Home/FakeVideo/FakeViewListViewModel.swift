//
//  FakeViewListViewModel.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//

import Foundation

class FakeViewListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var hotCharacters: [Character] = []
    @Published var gridCharacters: [Character] = []
    @Published var errorMessage: String?
    @Published var categories: [String] = ["ALL", "HOT"]
    @Published var selectedCategory: String = "ALL"
    
    func loadData(fromLocal: Bool) {
        NetworkService.shared.loadCharacters(fromLocal: fromLocal) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.characters = characters
                    self.gridCharacters = characters
                    self.hotCharacters = characters.filter { $0.isHot == true }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
