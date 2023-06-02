//
//  BreedDetailView.swift
//  kitty-api
//
//  Created by Jan Vítů on 01.06.2023.
//

import SwiftUI

struct BreedDetailView: View {
  let breed: Breed
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      BackgroundGradientView()
      ScrollView{
        VStack(alignment: .leading, spacing: 16) {
          makeInfo(breed: breed)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 16)
      }
    }
    .navigationTitle(breed.name)
    
  }
}

private extension BreedDetailView {
  func makeInfo(breed: Breed) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Info")
        .font(.appSectionTitle)
        .foregroundColor(.appTextSectionTitle)
      
      makeInfoRow(title: breed.name, iconName: "info.circle")
      makeInfoRow(title: breed.description, iconName: "film")
      VStack(alignment: .leading) {
        Text(breed.description)
          .font(.appSectionTitle)
          .foregroundColor(.appTextSectionTitle)
          .padding(.horizontal, 8)
          .padding(.vertical, 8)
        
      }
    }.toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        if let url = breed.wikipedia_url {
          ShareLink(item: url)
        }
      }
    }
  }
  
  func makeInfoRow(title: String, iconName: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Image(systemName: iconName)
      
      Text(title)
    }
    .font(.appItemDescription)
    .foregroundColor(.appTextBody)
  }
}


