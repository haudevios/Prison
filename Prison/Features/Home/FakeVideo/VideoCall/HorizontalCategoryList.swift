//
//  HorizontalCategoryList.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//
import SwiftUI
import SDWebImageSwiftUI

struct HorizontalCategoryList: View {
    var characters: [Character] = []

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(characters) { character in
                    
                    NavigationLink(destination: CallVideoScreenView(viewModel: CallVideoPerCharacterViewModel(character: character))) {
                        GeometryReader { geo in
                            let midX = geo.frame(in: .global).midX
                            let screenMidX = UIScreen.main.bounds.width / 2
                            let distance = abs(screenMidX - midX)
                            let scale = max(0.85, 1 - (distance / screenMidX) * 0.2)

                            VStack {
                                WebImage(url: URL(string: Constants.shared.baseURL + character.avatar)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.main.bounds.width * (100/360), height: UIScreen.main.bounds.width * (100/360))
                                        .clipped()
                                        .cornerRadius(12)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            .scaleEffect(scale)
                            .animation(.easeOut(duration: 0.3), value: scale)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
                            .frame(width: UIScreen.main.bounds.width * (100/360), height: UIScreen.main.bounds.width * (100/360))
                        }
                        .frame(width: UIScreen.main.bounds.width * (100/360), height: UIScreen.main.bounds.width * (100/360))
                    }
                
                }
            }
            .padding(.horizontal, 16)
           
        }
    }
}

