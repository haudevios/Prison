//
//  DotIndicatorView.swift
//  Prison
//
//  Created by umaxsoft on 23/6/25.
//
import SwiftUI
struct DotIndicatorView: View {
    let count: Int
    let currentIndex: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<count, id: \.self) { index in
                let isSelected = index == currentIndex
                if isSelected {
                    Rectangle()
                        .fill(isSelected ? Color(hex: "#e6055d") : Color(hex: "#4e0020"))
                        .frame(width: isSelected ? 45 : 8, height: 8)
                        .animation(.easeInOut(duration: 0.3), value: currentIndex)
                        .cornerRadius(4)
                } else {
                    Circle()
                        .fill(isSelected ? Color(hex: "#e6055d") : Color(hex: "#4e0020"))
                        .frame(width: isSelected ? 45 : 8, height: 8)
                        .animation(.easeInOut(duration: 0.3), value: currentIndex)
                }
            }
        }
    }
}

#Preview {
    DotIndicatorView(count: 3, currentIndex: 0)
}
