//
//  BreedDetailViewModel.swift
//  kitty-api
//
//  Created by Jan Vítů on 01.06.2023.
//

import Foundation

@MainActor  final class BreedDetailViewModel: ObservableObject {
  enum State {
    case initial
    case loading
    case fetched
    case failed
  }
  
  var id: String?
  @Published var state: State = .initial
  @Published var breed: Breed?
  
  nonisolated init(id: String? = nil) {
    self.id = id
  }
  
  func fetch() async {
    state = .loading
    
    try! await Task.sleep(for: .seconds(2))
    state = .fetched
    
  }
}
