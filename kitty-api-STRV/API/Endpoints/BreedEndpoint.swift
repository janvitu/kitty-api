//
//  BreedEndpoint.swift
//  kitty-api
//
//  Created by Jan Vítů on 02.06.2023.
//

import Foundation


enum BreedsEnpoint: Endpoint {
  
  case getBreeds
  
  
  var path: String {
    switch self {
    case .getBreeds:
      return "breeds"
    }
  }
}
