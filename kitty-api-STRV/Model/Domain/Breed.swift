//
//  Specie.swift
//  kitty-api-STRV
//
//  Created by Jan Vítů on 01.06.2023.
//

import Foundation

struct Breed {
  struct Image: Equatable, Decodable {
    let id: String
    let width: Int
    let height: Int
    let url: String
  }
  let id: String
  let name: String
  let description: String
  let child_friendly: Int
  let wikipedia_url: String?
  let image: Image?
}

// MARK: - Conformances
extension Breed: Identifiable {}
extension Breed: Equatable {}
extension Breed: Decodable {}
// MARK: - Mock
