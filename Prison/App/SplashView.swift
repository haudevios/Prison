import SwiftUI
import DotLottie

struct SplashView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            RootView()
        } else {
            GeometryReader { geometry in
                ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.8)
                        
                        DotLottieAnimation(
                            fileName: "loading",
                            config: AnimationConfig(autoplay: true, loop: true)
                        )
                        .view()
                        .frame(width: geometry.size.width * 0.51111 , height: geometry.size.width * 0.3)
                        
                        Image("model")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.83333, height: geometry.size.height * 0.36667)
                        Spacer()
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isActive = true
                    }
                }
        }
        }
    }
}

#Preview {
        SplashView()
}
