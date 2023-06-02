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
    VStack(alignment: .leading, spacing: 16) {
      
      Text(breed.name)
        .font(.appItemLargeTitle)
        .foregroundColor(.appTextItemTitle)
      Text("\(breed.description)")
        .font(.appItemDescription)
        .multilineTextAlignment(.leading)
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.appBackgroundItem)
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
}

// MARK: - Previews

