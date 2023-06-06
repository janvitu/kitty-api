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
      }
    }
  }
}

private extension BreedDetailView {
  func makeInfo(breed: Breed) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      VStack(alignment: .leading, spacing: 8) {
        Text("Breed: \(breed.name)")
          .font(.appTextXL)
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
      }
      .padding(.vertical, 8)
        .padding(.horizontal, 8)
        
      VStack(alignment: .leading) {
        Text(breed.description)
          .padding(.vertical, 8)
          .foregroundColor(.appTextSectionTitle)
          .font(.appTextLGRegular)
        HStack(spacing: 40) {
          VStack(alignment: .leading) {
            Text("Origin:")
              .font(.appTextBaseMedium)
              .foregroundColor(.appTextBody)
            Text(breed.origin)
              .font(.appTextBaseRegular)
              .foregroundColor(.appTextBody)
          }
          VStack(alignment: .leading) {
            Text("Lifespan:")
              .font(.appTextBaseMedium)
              .foregroundColor(.appTextBody)
            Text("\(breed.life_span) years")
              .font(.appTextBaseRegular)
              .foregroundColor(.appTextBody)
          }
        }
      }
      .padding(.vertical, 8)
      .padding(.horizontal, 8)
      .overlay(Divider().background(.black), alignment: .bottom)
      makeDetail(breed: breed)
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
  
  func makeDetail(breed: Breed) -> some View {
    let numberOfColumns = 3
    var gridItems: [GridItem] {
      Array(repeating: .init(.flexible()), count: numberOfColumns)
    }
    
    return LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10 ) {
      ForEach(breed.characteristics, id: \.self) { characteristic in
        makeDetailItem(level: characteristic.level, parameter: characteristic.description)
      }
    }
    .padding(.vertical, 8)
    .padding(.horizontal, 8)
  }
  
  func makeDetailItem(level: Int, parameter: String) -> some View {
    return VStack(alignment: .leading){
      Text(parameter)
        .font(.appTextSM)
        .foregroundColor(.appTextBody)
      makeDetailIndicator(level: level)
    }
  }
  func makeDetailIndicator(level: Int) -> some View {
    let maxLevel = 5
    return HStack(spacing: 6) {
      ForEach(0..<level, id: \.self) { i in
        Circle()
          .stroke(lineWidth: 1)
          .background(Circle().foregroundColor(.black))
          .frame(width: 7, height: 7)
      }
      ForEach(0..<maxLevel-level, id: \.self) { i in
        Circle()
          .stroke(lineWidth: 1)
          .background(.white)
          .frame(width: 7, height: 7)
        
      }
    }
  }
}



