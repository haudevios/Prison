//
//  IntroScreensViewModel.swift
//  Prison
//
//  Created by umaxsoft on 23/6/25.
//
import Foundation
import Combine

class IntroScreensViewModel: ObservableObject {
    @Published  var currentIndex = 0

    @Published var pages: [IntroScreen] = [
        IntroScreen(imageName: "intro_image1", adUnitID: "ca-app-pub-xxx/native1", textImage: "intro_text2"),
        IntroScreen(imageName: "intro_image2", adUnitID: "ca-app-pub-xxx/native2", textImage: "intro_text3"),
        IntroScreen(imageName: "intro_image3", adUnitID: "ca-app-pub-xxx/native3", textImage: "intro_text")
    ]
}
