//
//  CallVideoScreenView.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//

import SwiftUI
import SDWebImageSwiftUI
public struct CallVideoScreenView: View {
    var width = UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CallVideoPerCharacterViewModel
    
    @State private var pulse = false
    @State private var shake = false
   
    let pulseTimer = Timer.publish(every: 1.2, on: .main, in: .common).autoconnect()
    let shakeTimer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()

    public var body: some View {
        if viewModel.inCall == true, viewModel.inEnd == false {
            CallVideoDirectView(viewModel: CallVideoDirectViewModel(), characterViewModel: viewModel)
        } else if viewModel.inCall == false && viewModel.inEnd == false {
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
                        .font(.custom("Technology-Bold", size: 40))
                    Text("Incoming video call ...")
                        .foregroundColor(.white)
                        .font(.custom("Inner-Bold", size: 20))
                    
                    Spacer()
                    HStack {
                        Image("callvideo_decline")
                            .resizable()
                            .frame(width: width * (72/360), height: width * (72/360))
                            .padding(.leading, width * (60/360))
                            .scaleEffect(pulse ? 1.015 : 1.0) // Chỉ zoom 1.5%
                            .rotationEffect(.degrees(shake ? 0.5 : -0.5)) // Rung chỉ 0.5 độm
                            .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: pulse)
                            .animation(.easeInOut(duration: 0.1).repeatForever(autoreverses: true), value: shake)
                            .onTapGesture {
                                dismiss()
                            }
                        Spacer()
                        
                        Image("callvideo_accept")
                            .resizable()
                            .frame(width: width * (72/360), height: width * (72/360))
                            .padding(.trailing, width * (60/360))
                            .scaleEffect(pulse ? 1.015 : 1.0)
                            .rotationEffect(.degrees(shake ? 0.5 : -0.5))
                            .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: pulse)
                            .animation(.easeInOut(duration: 0.1).repeatForever(autoreverses: true), value: shake)
                            .onTapGesture {
                                viewModel.acceptCall()
                            }
                    }
                    .frame(width: width)
                     Spacer()
                }
            }
            .onAppear {
                pulse = true
                shake = true
            }
            .onReceive(pulseTimer) { _ in
                withAnimation(.easeInOut(duration: 0.6)) {
                    pulse.toggle()
                }
            }
            .onReceive(shakeTimer) { _ in
                withAnimation(.easeInOut(duration: 0.1)) {
                    shake.toggle()
                }
            }
            .navigationBarBackButtonHidden(true)
        } else  if viewModel.inCall == false && viewModel.inEnd == true {
            CallViewEndView(viewModel: viewModel)
        }
    }
}

#Preview {
    CallVideoScreenView(viewModel: CallVideoPerCharacterViewModel(character: Character(id: "22", name: "Young-hee", avatar: "avatar/BOSS_v2.png", video:  "video/BOSS_v2.mp4", isHot: false)))
}
