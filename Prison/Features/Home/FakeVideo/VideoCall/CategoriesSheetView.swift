//
//  CategoriesSheetView.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//
import SwiftUI
struct CategoriesSheetView: View {
    @Binding var showSheet: Bool
    @ObservedObject var viewModel: FakeViewListViewModel
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.categories, id: \.self) { category in
                    Button {
                        showSheet = false
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
                            .foregroundColor(.black)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.clear)
                            .stroke(Color.black, lineWidth: 2 )
                    )
                    .padding(.horizontal, 4)
                    .padding(.vertical, 3)
                }
            }
            .padding()
            Spacer()
        }
        .padding()
        
    }
}
