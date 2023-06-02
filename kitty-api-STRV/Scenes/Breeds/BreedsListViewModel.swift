//
//  BreedListViewModel.swift
//  kitty-api
//
//  Created by Jan Vítů on 01.06.2023.
//

import Foundation

@MainActor final class BreedsListViewModel: ObservableObject {
  
  enum State {
    case initial
    case loading
    case fetched
    case failed
  }
  
  @Injected private var apiManager: APIManaging
  
  
  @Published var breeds: [Breed] = []
  @Published var state: State = .initial
  
  func load() async {
    state = .loading
    await fetch()
  }
  
  func fetch() async {
    do {
      let endpoint = BreedsEnpoint.getBreeds
      let res: [Breed] = try await apiManager.request(endpoint: endpoint)
      
      breeds = res
      state = .fetched
    } catch {
      if let error = error as? URLError, error.code == .cancelled {
        Logger.log("URL request was cancelled", .info)
        state = .fetched
        return
      }
      
      debugPrint(error)
      state = .failed
    }
  }
}
