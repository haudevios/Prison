//
//  GridCategoryList.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//

import SwiftUI
import SDWebImageSwiftUI
struct GridCategoryList: View {
    let columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width * (100/360)))
    ]
    var gridCharacter: [Character]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(Array(gridCharacter.prefix(3).enumerated()), id: \.element.id) { index, character in
                    NavigationLink(destination: CallVideoScreenView(viewModel: CallVideoPerCharacterViewModel(character: character))) {
                                CharacterItem(character: character)
                    }
                }
            }

            AdPlaceholderView()
                .frame(width: UIScreen.main.bounds.width * (300/360))
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 4)

            LazyVGrid(columns: columns) {
                ForEach(Array(gridCharacter.dropFirst(3).enumerated()), id: \.element.id) { index, character in
                    NavigationLink(destination: CallVideoScreenView(viewModel: CallVideoPerCharacterViewModel(character: character))) {
                                CharacterItem(character: character)
                    }
                }
            }
            Spacer(minLength: 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CharacterItem: View {
    let character: Character

    var body: some View {
        VStack {
            WebImage(url: URL(string: Constants.shared.baseURL + character.avatar)) { image in
                VStack {
                    image.resizable()
                        .scaledToFill()
                        .frame(width:UIScreen.main.bounds.width * (100/360), height: UIScreen.main.bounds.width * (100/360))
                        .clipped()
                        .cornerRadius(12)
                    Text("\(character.name)")
                        .foregroundColor(.white)
                }
            } placeholder: {
                ProgressView()
            }
        }
    }
}

