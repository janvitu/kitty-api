//
//  BreedsListItemView.swift
//  kitty-api
//
//  Created by Jan Vítů on 01.06.2023.
//

import SwiftUI

struct BreedsListItemView: View {
  let breed: Breed
  
  
  var body: some View {
    VStack(alignment: .leading) {
      if let img = breed.image {
        AsyncImage(url: URL(string: img.url)) { image in
          image
            .resizable()
            .cornerRadius(8)
            .aspectRatio(contentMode: .fit)
        } placeholder: {
          ProgressView()
        }
      }
      Text(breed.name)
        .font(.appTextXL)
        .foregroundColor(.appTextItemTitle)
      Text("\(breed.description)")
        .font(.appTextBaseRegular)
        .foregroundColor(.appTextBody)
        .multilineTextAlignment(.leading)
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

// MARK: - Previews

