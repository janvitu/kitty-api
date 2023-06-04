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
  
  let gridItems: [GridItem] = [
    GridItem(.flexible(), spacing: 4),
    GridItem(.flexible(), spacing: 4),
    GridItem(.flexible(), spacing: 4)
  ]
  
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
    LazyVGrid(columns: gridItems, spacing: 10) {
        makeDetailIndicator(level: breed.adaptability, parameter: "Adaptability")
        makeDetailIndicator(level: breed.child_friendly, parameter: "Child friendly")
        makeDetailIndicator(level: breed.energy_level, parameter: "Energy level")
        makeDetailIndicator(level: breed.health_issues, parameter: "Health issues")
        makeDetailIndicator(level: breed.intelligence, parameter: "Intelligence")
        makeDetailIndicator(level: breed.shedding_level, parameter: "Shedding level")
      
      makeDetailIndicator(level: breed.social_needs, parameter: "Social needs")
      makeDetailIndicator(level: breed.stranger_friendly, parameter: "Stranger friendly")
      makeDetailIndicator(level: breed.vocalisation, parameter: "vocalisation")
      }
    .padding(.vertical, 8)
    .padding(.horizontal, 8)
  }
  
  func makeDetailIndicator(level: Int, parameter: String) -> some View {
    let maxLevel = 5
    
    return VStack(alignment: .leading){
      Text(parameter)
        .font(.appTextSM)
        .foregroundColor(.appTextBody)
      HStack(spacing: 6) {
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
}



