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
      BackgroundGradientView()
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
        }
      }
      .padding(.horizontal, 8)
    }
  }
  
//  func fetchData() {
//    guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
//      print("Invalid URL")
//      return
//    }
//
//    let session = URLSession.shared
//
//    let task = session.dataTask(with: url) { (data, response, error) in
//      if let error = error {
//        print("Error: \(error)")
//        return
//      }
//
//      guard let response = response as? HTTPURLResponse else {
//        print("Invalid response")
//        return
//      }
//
//      guard (200...299).contains(response.statusCode) else {
//        print("Invalid status code: \(response.statusCode)")
//        return
//      }
//
//      guard let data = data else {
//        print("No data received")
//        return
//      }
//
//      do {
//        let breeds = try JSONDecoder().decode([Breed].self, from: data)
//        DispatchQueue.main.async {
//          self.breeds = breeds
//        }
//      } catch {
//        print("Error parsing JSON: \(error)")
//      }
//    }
//
//    task.resume()
//  }
}
