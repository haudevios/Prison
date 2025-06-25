//
//  CallViewEndView.swift
//  Prison
//
//  Created by umaxsoft on 25/6/25.
//
import SwiftUI
struct CallViewEndView: View {
    @ObservedObject var viewModel: CallVideoPerCharacterViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Text("CallViewEndView")
                .onTapGesture {
                    viewModel.resetCall()
                    dismiss()
                }
        }
        .navigationBarBackButtonHidden(true)
      
    }
}
