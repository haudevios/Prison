import SwiftUI
import AVFoundation

public struct CallVideoDirectView: View {
    @ObservedObject var viewModel: CallVideoDirectViewModel
    @ObservedObject var characterViewModel: CallVideoPerCharacterViewModel

    @Environment(\.dismiss) private var dismiss

    let cameraSize: CGSize = CGSize(width: UIScreen.main.bounds.width * (120/360), height: UIScreen.main.bounds.width * (120/360) + 50)

    public var body: some View {
        ZStack {
            if let url = URL(string: Constants.shared.baseURL + characterViewModel.character.video) {
                VideoPlayerContainer(player: viewModel.player)
                    .onAppear {
                        do {
                            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback)
                            try AVAudioSession.sharedInstance().setActive(true)
                        } catch {
                            print("AVAudioSession error: \(error)")
                        }

                        viewModel.player.replaceCurrentItem(with: AVPlayerItem(url: url))
                        viewModel.player.isMuted = viewModel.isVideoMuted
                        viewModel.player.play()
                    }
                    .onChange(of: viewModel.isVideoMuted) { newValue in
                        viewModel.player.isMuted = newValue
                    }
                    .ignoresSafeArea()
            }

            // MARK: - Timer
            VStack {
                Text(viewModel.timeString(from: viewModel.timeElapsed))
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.top, 25)
                Spacer()
                HStack {
                    Spacer()
                    if viewModel.showCamera {
                        CameraPreviewView(session: viewModel.cameraSession)
                            .frame(width: cameraSize.width, height: cameraSize.height)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 2))
                            .position(viewModel.dragPosition)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        let screen = UIScreen.main.bounds
                                        let topLimit = cameraSize.height / 2
                                        let bottomLimit = screen.height - 270 - cameraSize.height / 2
                                        let padding: CGFloat = 20
                                        let minX = cameraSize.width / 2 + padding
                                        let maxX = screen.width - cameraSize.width / 2 - padding
                                        let newX = min(max(value.location.x, minX), maxX)
                                        let newY = min(max(value.location.y, topLimit), bottomLimit)
                                        viewModel.dragPosition = CGPoint(x: newX, y: newY)
                                    }
                            )
                    }
                }
            }

            // MARK: - Buttons
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button {
                        viewModel.showCamera.toggle()
                    } label: {
                        Image(systemName: viewModel.showCamera ? "video.fill" : "video.slash.fill")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }

                    Button {
                        viewModel.isVideoMuted.toggle()
                    } label: {
                        Image(systemName: viewModel.isVideoMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }

                    Button {
                        viewModel.isMicOn.toggle()
                    } label: {
                        Image(systemName: viewModel.isMicOn ? "mic.fill" : "mic.slash.fill")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }

                    Button {
                        endCallAndDismiss()
                    } label: {
                        Image(systemName: "phone.down.fill")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            viewModel.startTimer()
            viewModel.setupCamera()
        }
        .onDisappear {
            viewModel.stopTimer()
            viewModel.stopVideo()
            viewModel.cameraSession.stopRunning()
        }
        .navigationBarBackButtonHidden(true)
    }

    func endCallAndDismiss() {
        viewModel.stopTimer()
        viewModel.stopVideo()
        characterViewModel.endCall()
        dismiss()
    }
}
