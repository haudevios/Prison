//
//  CallViewEndView.swift
//  Prison
//
//  Created by umaxsoft on 25/6/25.
//
import SwiftUI
import SDWebImageSwiftUI
struct CallViewEndView: View {
    var width = UIScreen.main.bounds.width
    @ObservedObject var viewModel: CallVideoPerCharacterViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isVisible = true

    var body: some View {
        ZStack {
            WebImage(url: URL(string: Constants.shared.baseURL + viewModel.character.avatar)) { image in
                    image
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(Color.black.opacity(0.5))
                    
            } placeholder: {
                ProgressView()
            }
            
            VStack {
                Spacer()
                WebImage(url: URL(string: Constants.shared.baseURL + viewModel.character.avatar)) { image in
                        image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width * (126/360), height:  width * (126/360))
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color(hex: "#e6055d"), lineWidth: 5)
                            )
                        .shadow(radius: 5)
                    
                } placeholder: {
                    ProgressView()
                }
                Text("\(viewModel.character.name)")
                    .foregroundColor(.white)
                    .font(.custom("Inder-Bold", size: 40))
                Text("Call END")
                    .foregroundColor(.red)
                    .font(.custom("Inder-Bold", size: 20))
                
                Spacer()
                Text("Tab to closed")
                    .foregroundColor(.red)
                    .font(.custom("Inder-Bold", size: 24))
                    .opacity(isVisible ? 1 : 0) // ← THÊM DÒNG NÀY để ẩn/hiện
                    .onTapGesture {
                        viewModel.resetCall()
                        dismiss()
                    }
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isVisible.toggle()
                            }
                        }
                    }

                 Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    CallViewEndView(viewModel: CallVideoPerCharacterViewModel(character: Character(id: "22", name: "Young-hee", avatar: "avatar/BOSS_v2.png", video:  "video/BOSS_v2.mp4", isHot: false)))
}
