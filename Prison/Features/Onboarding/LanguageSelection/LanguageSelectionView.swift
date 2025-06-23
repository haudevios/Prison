import SwiftUI

struct LanguageSelectionView: View {
    let onNext: () -> Void
    @EnvironmentObject var appState: AppState
   
    @StateObject private var viewModel = LanguageSelectionViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("back")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // Top bar
                    Rectangle()
                        .fill(Color(hex: "#004145"))
                        .frame(height: geometry.size.height * (110 / 800))
                        .ignoresSafeArea()
                        .overlay(
                            VStack {
                                if geometry.size.width < 700 {
                                    Spacer()
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Image("lan")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width * (136 / 360))
                                    Spacer()
                                    Image("\(viewModel.selectedLanguage.isEmpty ? "button_none": "button")")
                                        .onTapGesture {
                                            if !viewModel.selectedLanguage.isEmpty {
                                                appState.currentLanguage = viewModel.selectedLanguage
                                                onNext()
                                            }
                                        }
                                        
                                }
                                .padding(.horizontal)
                                Spacer()
                            }
                        )
                    
                    Spacer()
                    
                    // Language buttons
                    ScrollView {
                        VStack {
                            ForEach(viewModel.languages, id: \.code) { language in
                                Button(action: {
                                    viewModel.selectedLanguage = language.code
                                }) {
                                    HStack {
                                        Image(language.code)
                                        Spacer()
                                        Text(language.name)
                                            .foregroundColor(.white)
                                        Spacer()
                                        if viewModel.selectedLanguage == language.code {
                                            Image("selected")
                                        } else {
                                            Image("select")
                                               
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                .frame(width: geometry.size.width * (329 / 360), height: geometry.size.height * (56 / 800))
                                .background(Color(hex: "#004145"))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(
                                            viewModel.selectedLanguage == language.code ? Color(hex: "#e6055d") : Color(hex: "#006369"),
                                            lineWidth: 2
                                        )
                                )
                                .padding(.horizontal)
                                .padding(.top)
                            }
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    LanguageSelectionView(onNext: {})
        .environmentObject(AppState())
}
