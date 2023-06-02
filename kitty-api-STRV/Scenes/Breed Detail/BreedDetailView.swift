//
//  BreedDetailView.swift
//  kitty-api
//
//  Created by Jan Vítů on 01.06.2023.
//

import SwiftUI
import SafariServices

struct BreedDetailView: View {
  let breed: Breed
  
  @State private var isPresentingModal = false
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      ScrollView{
        VStack(alignment: .leading, spacing: 16) {
          makeInfo(breed: breed)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 16)
      }
    }
  }
}

private extension BreedDetailView {
  func makeInfo(breed: Breed) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Breed: \(breed.name)")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.appTextSectionTitle)
      if let img = breed.image {
        AsyncImage(url: URL(string: img.url)) { image in
          image
            .resizable()
            .cornerRadius(4)
            .aspectRatio(contentMode: .fit)
        } placeholder: {
          ProgressView()
        }
      }
      VStack(alignment: .leading) {
        Text(breed.description)
          .padding(.vertical, 8)
          .foregroundColor(.appTextSectionTitle)
      }
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        if let url = URL(string: breed.wikipedia_url!) {
          Button("wiki") {
            isPresentingModal = true
          }.sheet(isPresented: $isPresentingModal) {
            SafariView(url: url)
          }
        }
      }
    }
  }
  
  
}



