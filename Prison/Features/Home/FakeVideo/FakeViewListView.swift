//
//  FakeViewListView.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//

import SwiftUI

public struct FakeViewListView: View {
    @StateObject private var viewModel = FakeViewListViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showSheet = false

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("intro_back")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.red)
                            Text("Hot")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 6)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 2)
                                .background(Color.clear)
                        )
                        Spacer()
                    }
                    .padding()
                    HorizontalCategoryList(characters: viewModel.hotCharacters)
                    HStack {
                        Image("filter")
                            .resizable()
                            .frame(width: 30, height: 20)
                            .foregroundColor(.white)
                            .onTapGesture {
                                showSheet = true
                            }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.categories, id: \.self) { category in
                                    Button {
                                        viewModel.selectedCategory = category
                                        print("\(viewModel.selectedCategory)")
                                        if viewModel.selectedCategory == "ALL" {
                                            viewModel.gridCharacters = viewModel.characters
                                        } else {
                                            viewModel.gridCharacters = viewModel.hotCharacters
                                        }
                                    } label: {
                                        Text("\(category)")
                                            .padding(.horizontal)
                                            .foregroundColor(.white)
                                    }
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(viewModel.selectedCategory == category ? Color.blue : Color.clear)
                                            .stroke(viewModel.selectedCategory == category ? Color.clear : Color.white, lineWidth: 2 )
                                    )
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 3)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    GridCategoryList(gridCharacter: viewModel.gridCharacters)
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("FAKE VIDEO CALL")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadData(fromLocal: true)
        }
        .sheet(isPresented: $showSheet) {
            CategoriesSheetView(showSheet: $showSheet, viewModel: viewModel)
                .presentationDetents([.fraction(0.33)])
                .presentationDragIndicator(.visible)
        }
        
    }
}

#Preview {
    FakeViewListView()
}
