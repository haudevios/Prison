//
//  CallVideoDirectViewModel.swift
//  Prison
//
//  Created by umaxsoft on 25/6/25.
//


import Foundation
import AVFoundation
import SwiftUI

class CallVideoDirectViewModel: ObservableObject {
    @Published var timeElapsed: Int = 0
    @Published var isMicOn: Bool = true
    @Published var isVideoMuted: Bool = false
    @Published var showCamera: Bool = true
    @Published var dragPosition: CGPoint

    let cameraSession = AVCaptureSession()
    let player = AVPlayer()
    
    private var timer: Timer?

    init() {
        // Tính toán vị trí mặc định
        let screenWidth = UIScreen.main.bounds.width
        let topPadding: CGFloat = 20
        let rightPadding: CGFloat = 20
        let width = screenWidth * (120 / 360)
        let height = width + 50
        let x = screenWidth - (width / 2) - rightPadding
        let y = (height / 2) + topPadding
        self.dragPosition = CGPoint(x: x, y: y)
    }

    func setupCamera() {
        cameraSession.beginConfiguration()
        cameraSession.sessionPreset = .medium

        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: device),
              cameraSession.canAddInput(input) else {
            cameraSession.commitConfiguration()
            return
        }

        cameraSession.addInput(input)

        let output = AVCaptureVideoDataOutput()
        if cameraSession.canAddOutput(output) {
            cameraSession.addOutput(output)
        }

        cameraSession.commitConfiguration()
        DispatchQueue.global(qos: .userInitiated).async {
            self.cameraSession.startRunning()
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                self.timeElapsed += 1
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func stopVideo() {
        player.pause()
        player.replaceCurrentItem(with: nil)
    }

    func timeString(from seconds: Int) -> String {
        String(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
}

