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
        GridItem(.adaptive(minimum: 120))
    ]
    var gridCharacter: [Character]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(gridCharacter) { character in
                    VStack {
                        WebImage(url: URL(string: "https://game.umaxsoft.com/prison/" + character.avatar)) { image in
                            VStack {
                                image.resizable()
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
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
        }
    }
}

