//
//  Untitled.swift
//  Prison
//
//  Created by umaxsoft on 23/6/25.
//

import SwiftUI

struct IntroScreen: Identifiable {
    let id = UUID()
    let imageName: String
    let adUnitID: String
    let textImage: String
}

struct IntroScreensView: View {
    @StateObject var viewModel: IntroScreensViewModel = IntroScreensViewModel()
    let onNext: () -> Void
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("intro_back")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    TabView(selection: $viewModel.currentIndex) {
                        ForEach(Array(viewModel.pages.enumerated()), id: \.offset) { index, page in
                            VStack {
                                if geometry.size.width > 700 {
                                    Text("Design for iPad is nil")
                                } else {
                                    Image(page.imageName)
                                        .resizable()
                                        .scaledToFit()
                                }
                                    
                                HStack {
                                    DotIndicatorView(count: viewModel.pages.count, currentIndex: viewModel.currentIndex)
                                    Spacer()
                                    Button(action: {
                                        if viewModel.currentIndex < viewModel.pages.count - 1 {
                                            withAnimation {
                                                viewModel.currentIndex += 1
                                            }
                                        } else {
                                            self.onNext()
                                        }
                                    }) {
                                        Text(viewModel.currentIndex == viewModel.pages.count - 1 ? "Finish" : "Next")
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color(hex: "#e6055d"))
                                            .cornerRadius(10)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top, -60)
                                
                                Image("\(page.textImage)")
                                
                                AdPlaceholderView()
                                
                                Spacer()
                            }
                            .tag(index)
                            .padding(.horizontal)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }
    }
}



#Preview {
    IntroScreensView(onNext: {})
}
