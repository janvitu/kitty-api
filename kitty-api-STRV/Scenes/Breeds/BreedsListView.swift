//
//  BreedsListView.swift
//  kitty-api
//
//  Created by Jan Vítů on 01.06.2023.
//

import SwiftUI

struct BreedsListView: View {
  
  @StateObject var viewModel = BreedsListViewModel()
  
  func makeList() -> some View {
    LazyVStack(alignment: .leading, spacing: 12) {
      ForEach(viewModel.breeds) {
        breed in
        BreedsListItemView(breed: breed)
      }
    }
  }
  var body: some View {
    ZStack {
      content
    }.onFirstAppear {
      Task {
        await viewModel.load()
      }
    }
  }
  
  @ViewBuilder var content: some View {
    ScrollView {
      Group {
        LazyVStack {
          ForEach(viewModel.breeds) { breed in
            NavigationLink(destination: BreedDetailView(breed: breed)) {
              BreedsListItemView(breed: breed)
            }
          }
          .overlay(Divider().background(.black), alignment: .bottom)
        }
      }
    }
  }
}
