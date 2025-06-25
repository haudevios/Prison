//
//  CameraPreviewView.swift
//  Prison
//
//  Created by umaxsoft on 25/6/25.
//

import SwiftUI
import AVFoundation


// ✅ Subclass UIView để quản lý preview layer đúng cách
class CameraPreviewContainer: UIView {
    private var previewLayer: AVCaptureVideoPreviewLayer!

    init(session: AVCaptureSession) {
        super.init(frame: .zero)
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(previewLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        previewLayer.frame = bounds // ✅ Cập nhật frame khi layout thay đổi
    }
}

// ✅ Dùng UIViewRepresentable để gắn vào SwiftUI
struct CameraPreviewView: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        return CameraPreviewContainer(session: session)
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

